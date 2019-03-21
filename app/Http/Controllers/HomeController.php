<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Validator;
use Redirect;
use DB;
use App\Helpers\Email_sender;
use App\MassageText;
use App\User;
use App\Category;
use App\Treatment;
use App\Booking;
use Session;
use Route;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    { 
      $data['massage_text'] = MassageText::where("id",1)->first();

         if ($request->isMethod('post')) {
            $formData = $request->all();


            $rules = array(
                'email'=>'required|email|unique:subscribe,email'
            );

            $messsages = array(
                'email.required'=>'Enter Email Address',
                'email.unique'=>'This email id is already subscribe'
            );


            $validator = Validator::make($formData, $rules,$messsages);
            
            if ($validator->fails()) {
                $json['status'] = 'error';
                $json['message'] = 'Something went wrong!';
                $eror = $validator->errors()->toArray();
                echo '<span class="error_server">'.$eror['email'][0].'</span>';
                exit;
            }

            else {
                DB::table('subscribe')->insert(['email' => $formData['email']]);
                Email_sender::subscribeToUser($formData['email']);

                echo '<span class="success">You have successfully subscribed to the newsletter.</span>';
                exit;
            }
        }else {
            return view('home',$data);    
        }
    }

    public function logout(){
        Auth::logout();
        session()->invalidate();
        return redirect('login');
    }

    /*CMS Page*/
    public function viewPage($slug){
        $pageObj = DB::table('cms_page')->where('page_slug','=',$slug)->where('is_active','=','1')->where('is_delete','=','0')->first();
        if(empty($pageObj)){
            Session()->flash('danger_message','Page not pusblished!');
            Session()->flash('error_message','Page not pusblished!');
            return Redirect()->back();
        }
        return view('cms_pages.cms_page',compact('pageObj'));
    }

    public function aboutUs(){
        return view('cms_pages.about_us');
    }

    public function faq(){
        return view('cms_pages.faq');
    }
    
    /*End CMS Page*/

    public function demo_mail_template()
    {
        return view('emails.booking');
    }

    public function therapists(){
        $data['therapist'] = DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
        ->where(['users.is_active'=>'1','users.is_delete'=>'0','model_has_roles.role_id'=>2])->orderBy('id','desc')->get();

        return view("therapist.therapist_detail",$data);
    }

    public function therapists_detail($id){

        $data['therapist'] = DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
        ->where(['users.is_active'=>'1','users.is_delete'=>'0','model_has_roles.role_id'=>2,'users.id'=>$id])->orderBy('id','desc')->first();
        
        return view("therapist.therapist_full_detail",$data);
    }

    

    public function therapistsCount(Request $request){

         $selected_city_query = DB::table('region')
            ->select("region.*")
            ->where("region.city_name",$request->locality)
            ->where(['region.is_delete'=>'0','region.is_active'=>'1'])
            ->first();

         $selected_city_id  =   $selected_city_query->id;
         
         $therapist = DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
            ->where(['users.is_delete'=>'0','users.is_active'=>'1','model_has_roles.role_id'=>2])->orderBy('id','desc')->get();

         $count = 0;
         foreach ($therapist as  $tha) {

            if(!empty($tha->working_area)){
                $working_area = json_decode($tha->working_area,true);
                  if(in_array($selected_city_id, $working_area)){
                       $count++;     
                  }  
              }
         }  
         echo  $count;
         exit;
    }

    public function bookOrder(Request $request){

        $data['category'] = Category::where(["is_active"=>1,"is_delete"=>0])->get();
        $data['treatments'] = Treatment::where(["is_active"=>1,"is_delete"=>0])->get();
        $data['therapists'] = User::select('users.*')->join('model_has_roles', 'model_has_roles.model_id', '='
          , 'users.id')->where('model_has_roles.role_id', 2)->get();
        
        if($request->isMethod('post')){
            Session::forget('bookig_data');
            Session::push('bookig_data', $request->all());
            return redirect()->route('login');
        }
        return view("book_order",$data);
    }

    public function getPricetimeByTreatment(Request $request){
        $price_time =  DB::table('price_time')->where("treatments_id",$request->id)->get();
        
        if(!empty($request->type) && $request->type == 1){
            foreach ($price_time as  $pt) { ?>
             <div class="duration_time_div">
                <div class="md-radio">
                  <input type="radio" class="md-radiobtn duration"  id='duration1_<?php echo $pt->id; ?>' name="duration" data-duration='<?php echo $pt->time; ?> Minutes' data-price='<?php echo $pt->price; ?>' value='<?php echo $pt->id; ?>' data-id="1">
                  <label for='duration1_<?php echo $pt->id; ?>'>
                  <span></span>
                  <span class="check"></span>
                  <span class="box"></span> <?php echo $pt->time; ?> Minutes
                  </label>
                </div>
            </div>
            <?php }
         }
        else { ?>
          <div class="card">
         <ul class="list-group list-group-flush duration_time_div">
            <?php foreach ($price_time as  $pt) { ?>    
            <label class="block" for='duration_<?php echo $pt->id; ?>'>        
                 <li class="list-group-item"> 
                  <div class="row">
                    <div class="col-6"><?php echo $pt->time; ?> Minutes</div>
                    <div class="col-6"><input type="radio" class="md-radiobtn duration"  name="duration" data-duration='<?php echo $pt->time; ?> Minutes' data-price='<?php echo $pt->price; ?>' value='<?php echo $pt->id; ?>' id='duration_<?php echo $pt->id; ?>' data-id="1"><?php echo $pt->price; ?> </div>
                    <div class="col-2"></div>
                  </div>
                </li>
            </label> 
            <?php } ?>
            </ul></div>
        <?php exit;
        }
    }

    public function checkTherapistBooking(Request $request){

        $booking_date = date("Y-m-d",strtotime($request->booking_date));
        $booking_time = date("H:i:s",strtotime($request->booking_time));

        if(!empty($request->id)){
            $count =  DB::table('booking')->where(['is_active'=>1,'is_delete' =>0,'therapist_id'=>$request->therapist,'booking_date'=>$booking_date." 00:00:00",'booking_time'=>$booking_time])->whereNotIn('id',[$request->id])->count();
        }
        else {
            $count =  DB::table('booking')->where(['is_active'=>1,'is_delete' =>0,'therapist_id'=>$request->therapist,'booking_date'=>$booking_date." 00:00:00",'booking_time'=>$booking_time])->count();    
        }
        if($count > 0){
            return 1;
        }
        else {
            return 0;
        }
        exit;
    }

    public function datewisetime(Request $request){

        $booking_date = date("Y-m-d",strtotime($request->booking_date));
        $booking_time = date("H:i:s",strtotime($request->booking_time));
        $working_area = $request->working_area;
         ?>
        <div class="col-md-12">
          <div class="input-group">
              <div class="ohloop owl-carousel owl-theme">
                 <?php for($i=0; $i<=23; $i++) {
                  for($j=0; $j < 2; $j++) { ?>
                    <?php
                        $temp = $j;
                        $temp_i = $i;
                        $lenth_i = strlen($i);

                        if($lenth_i == 1){
                           $temp_i = "0".$i;
                        }

                        if($temp == 0){
                          $temp = "0".$temp; 
                        }
                        else if($temp == 1) {
                          $temp = 30;
                        }
                    $check_time =  $this->chectime($temp_i.":".$temp,$booking_date,$working_area);
                   ?>
                    
                        <div class="item<?php if($check_time == "not_available"){
                            echo "disable_time";
                           }  ?>" >
                          <label for="time<?php echo $temp_i; ?>:<?php echo $temp;?>" class="time_the">
                             <?php if($check_time == "available") { ?>
                             <input style="display: none;" type="radio" id="time<?php echo $temp_i; ?>:<?php echo $temp;?>" value="<?php echo $temp_i; ?>:<?php echo $temp;?>" name="time" class="md-radiobtn time_rad radiopos">
                            <?php } ?>
                            <h4><?php echo $temp_i; ?>:<?php echo $temp;?></h4>
                          </label>
                        </div>
                    <?php
                   }
               } ?>
              </div>
          </div>
        </div>
        <script type="text/javascript">
          jQuery(document).ready(function($) {
                $('.ohloop').owlCarousel({
                  // center: true,
                  items: 10,
                  loop: true,
                  margin: 10,
                  dots: false,
                  responsive: {
                    0: { items: 2, dots: false, nav: true },
                    480: { items: 4, dots: false, nav: true },
                    768: { items: 6, dots: false, nav: true },
                    1024: { items: 10, dots: false, nav: true },
                    1025: { items: 10, dots: false, nav: true }
                  }
                });

           });

          $(".time_the").click(function(){
               // $($(this).parent()).siblings().children().children().removeClass('selected_time');
               // $(this).children('div').addClass('selected_time');

               $($(this).parent()).parent().siblings().children().removeClass('selected_time');
               $(this).parent('div').addClass('selected_time');
           });
        </script>
        <?php
   }

   public function timewisetherapist(Request $request){

        $booking_date = date("Y-m-d",strtotime($request->booking_date));
        $booking_time = date("H:i:s",strtotime($request->booking_time));
        $working_area = $request->working_area;

        $working_area_id = DB::table('region')
        ->where(['city_name'=>$working_area])->orderBy('id','desc')->first();
        
        $therapists   = User::select('users.*')->join('model_has_roles', 'model_has_roles.model_id', '=', 'users.id')
                        ->where('model_has_roles.role_id', 2)
                        ->where('users.working_area', 'like', '%"'. $working_area_id->id . '"%')
                        ->get();

         ?>
       <div class="row">
         
         <?php 
         $countTherapist = 0; 
         foreach($therapists as $th) { 
          $check_time =  $this->checktherapist($booking_date,$booking_time,$th->id); ?>
          <?php if($check_time == 0) {  ?>
              <div class="col-md-4 therapist_radio" data-name="<?php echo $th->name; ?>">
                <input type="radio" id="therapist<?php echo $th->id; ?>" value="<?php echo $th->id; ?>" data-name="<?php echo $th->name; ?>" name="therapist" class="md-radiobtn radiopos therapist">
                <label for="therapist<?php echo $th->id; ?>">
                <div class="card">
                 <?php 
                 if(!empty($th->image)) {
                    if(!file_exists(public_path('uploads/user_resize/'.$th->image))) {
                          resizeSmallThumb($th->image); 
                    }
                    if(!file_exists(public_path('uploads/user_resize/'.$th->image))) { ?>
                    <img  src="<?php echo url('/public'); ?>/uploads/no_image.jpg"  alt="<?php echo $th->image; ?>">
                    <?php } else { ?>
                      <img class="card-img-top" src="<?php echo url('/public'); ?>/uploads/user_resize/<?php echo $th->image; ?>" alt="Card image cap">
                    <?php } ?>
                    
                    
                 <?php } else { ?>
                    <img  src="<?php echo url('/public'); ?>/uploads/no_image.jpg">
                 <?php } ?>
                  
                  <div class="card-body">
                    <h5 class="card-title"><?php echo $th->name; ?></h5>
                    <p class="card-text">
                      <?php echo $th->mobile_no; ?>
                    </p>
                    <p class="card-text">
                      <!-- <small class="text-muted"> -->
                      <?php echo $th->email; ?>
                      <!-- </small> -->
                  </p>
                  </div>
                </div>
                </label>  
                </div>
               <?php 
               $countTherapist++; 
             } ?>
          <?php }
          if($countTherapist == 0) { ?>
            <div class="col-md-12">
               Therapists not availabe this date and time.Choose another date and time.
               <script type="text/javascript">
                 $(".cnt_btn").bind('click', false);
               </script>
            </div> 
          <?php }
          else { ?>
              <script type="text/javascript">
                 $(".cnt_btn").unbind('click', false);
               </script>
          <?php } ?>
        </div> <?php
   }
   public function chectime($time,$booking_date,$working_area){

      $working_area_id = DB::table('region')
        ->where(['city_name'=>$working_area])->orderBy('id','desc')->first();

      $therapist = DB::table('users')->leftJoin('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
        ->where('users.working_area', 'like', '%"'. $working_area_id->id . '"%')
        ->where(['users.is_active'=>'1','users.is_delete'=>'0','model_has_roles.role_id'=>2])->orderBy('id','desc')->get();

      $checkTime =  "available";  
      foreach ($therapist as  $thera) {
           $count  = Booking::where(['therapist_id'=> $thera->id ,'booking_time'=>$time,'is_delete' =>0,'booking_date'=>$booking_date." 00:00:00"])->count();
           if($count == 0){
              $checkTime = "available";
           }
      }
      return $checkTime;   
   }

   public function checktherapist($booking_date,$booking_time,$therapist){
      return Booking::where(['is_active'=>1,'is_delete' =>0,'therapist_id'=>$therapist,'booking_date'=>$booking_date." 00:00:00",'booking_time'=>$booking_time])->count(); 
   }
   public function booking_process(Request $request)
   {
      $data['massage_text'] = MassageText::where("id",1)->first();

         if ($request->isMethod('post')) {
            $formData = $request->all();


            $rules = array(
                'email'=>'required|email|unique:subscribe,email'
            );

            $messsages = array(
                'email.required'=>'Enter Email Address',
                'email.unique'=>'This email id is already subscribe'
            );


            $validator = Validator::make($formData, $rules,$messsages);
            
            if ($validator->fails()) {
                $json['status'] = 'error';
                $json['message'] = 'Something went wrong!';
                $eror = $validator->errors()->toArray();
                echo '<span class="error_server">'.$eror['email'][0].'</span>';
                exit;
            }

            else {
                DB::table('subscribe')->insert(['email' => $formData['email']]);
                Email_sender::subscribeToUser($formData['email']);

                echo '<span class="success">You have successfully subscribed to the newsletter.</span>';
                exit;
            }
        }else {
            return view('booking_process_demo',$data);    
        }
      
   }

}
