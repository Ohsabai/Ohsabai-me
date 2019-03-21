<?php

namespace App\Http\Controllers\therapist;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\User;
use Hash;
use DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use App\Region;
use App\Category;
use App\Treatment;
use PDF;
use Validator;


class HomeController extends Controller{

    /**

     * Create a new controller instance.

     *

     * @return void

     */

    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        return view('therapist.home');
    }

    public function getLatBookList(){

        $login = Auth::guard('web')->user()['id'];

        $bookings = DB::table('booking')->select("booking.*","treatments.treatment_name","users.name as therapist_ame",'booking_activity.status as order_status')

                    ->leftJoin('treatments','treatments.id','=','booking.treatment_id')
                    ->leftJoin('users','users.id','=','booking.user_id')
                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')
                    ->where('booking.therapist_id',$login)
                    ->orderBy('booking.id',"DESC")
                    ->get();

        return Datatables::of($bookings)
        ->addColumn('booking_date_time',function($bookings){
            $booking_date_time = date('d M-Y',strtotime($bookings->booking_date))." ".date('h:i A',strtotime($bookings->booking_time));
            return $booking_date_time;
        })
        ->addColumn('total_amount',function($bookings){
            if(!empty($bookings->total_amount)){
              $total_amount = html_entity_decode(get_currency()) . $bookings->total_amount;  
            }
            else {
              $total_amount = html_entity_decode(get_currency()) . 0;
            }
            return $total_amount;
        })
        ->addColumn('download',function($bookings){
            $bookin_id_decrypt = encrypt_decrypt_fn('encrypt',$bookings->id);
            $download = "<a href='".url('/therapist/booking-pdf/'.$bookin_id_decrypt)."'><i class='fa fa-file-pdf-o'></i> Download</a>";
            return $download;
        })
        ->addColumn('current_status',function($bookings){
            if($bookings->order_status == "N"){
                $status = '<button type="button" class="btn btn green btn-xs" data-id="'.$bookings->id.'" title="New">New</button>';
            }
            else if($bookings->order_status == "C"){
                $status = '<button type="button" class="btn btn yellow btn-xs" data-id="'.$bookings->id.'" title="Confirmed">Confirmed</button>';
            }
            else if($bookings->order_status == "M"){
                 $status = '<button type="button" class="btn green-meadow btn-xs" data-id="'.$bookings->id.'" title="Completed">Completed</button>';
            }
            else if($bookings->order_status == "L"){ 
                $status = '<button type="button" class="btn red-sunglo btn-xs" title="Cancel">Canceled</button>';
            }
            return $status;
        })

         ->addColumn('change_status',function($bookings){
          if($bookings->order_status == "N"){
            $status = '<button type="button" class="btn btn yellow btn-xs status" data-id="'.$bookings->id.'" title="Confirm" data-value="C">Confirm</button>';
          }else if($bookings->order_status == "C"){
            $status = '<button type="button" class="btn green-meadow btn-xs status" data-id="'.$bookings->id.'" title="Complete" data-value="M">Complete</button>';
          }
          else if($bookings->order_status == "M"){
               $status = '<button type="button" class="btn green-meadow btn-xs" data-id="'.$bookings->id.'" title="Completed">Completed</button>';
          }
          else if($bookings->order_status == "L"){ 
               $status = '<button type="button" class="btn red-sunglo btn-xs" title="Cancel">Canceled</button>';
          }
          return $status;
        })

        
        ->rawColumns(['download','current_status','change_status'])
        ->make(true);
    }

    /*Change Password*/

    public function change_password(){
       return view('therapist.password');  
    }

    public function set_password(Request $request){
        $rules = array(
             'old_password' => 'required',
             'password' => 'required|string|min:6|confirmed',
             'password_confirmation' => 'required'
        );
        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
          return redirect()->back()->withErrors($validator)->withInput();
        }

        if (!(Hash::check($request->get('old_password'), Auth::user()->password))) {
          $request->session()->flash('error',"Your current password does not matches with the password you provided. Please try again.");
          return redirect('therapist/change-password');

        }

        if(strcmp($request->get('old_password'), $request->get('password')) == 0){
          $request->session()->flash('error',"New Password cannot be same as your current password. Please choose a different password.");
          return redirect('therapist/change-password');
        }

        $user = Auth::user();
        $user->password = bcrypt($request->get('password'));
        $user->save();

        $request->session()->flash('success',"Password changed successfully.");
        return redirect('therapist/change-password');
    }

    /*End Change Password*/


    public function change_profile(){

       $data['val'] = Auth::guard('web')->user();

       $data['region'] = Region::where(['is_delete' =>0])->get();

       $data['treatment'] = Treatment::where(['is_delete' =>0])->get();

       $data['categories'] = Category::where(['is_active'=>1,'is_delete' =>0])->get();

       $data['user'] = User::where(['is_active'=>1,'is_delete' =>0,'id' => Auth::user()->id])->first();

       $data['workig_area'] = DB::table('therapist_working_area')->where('therapist_id', Auth::user()->id)->pluck('area_id')->toArray();


       $data['therapist_services'] = DB::table('therapist_services')->where('therapist_id', Auth::user()->id)->pluck('service_id')->toArray();
  

       $arr_cate = array();

       foreach ($data['categories'] as  $value) {

          $arr_cate[] = $value->id;

       }


       if($data['val']->category_id != ""){

          $array_category = json_decode($data['val']->category_id,true);

       }  

       else {

          $array_category =  array();

       }


       $data['treats'] = DB::table('treatments')->select("treatments.*")

        //->leftJoin('category', 'category.id', '=', 'treatments.category_id')

        //->leftJoin('users', 'users.id', '=', 'treatments.category_id')

        ->where(['treatments.is_active'=>1,'treatments.is_delete' =>0])

        ->whereIn('treatments.category_id', $array_category)

        ->get();

        // echo "<pre>";
        // print_r($data['treats']);
        // exit;

       return view('therapist.profile',$data);   

    }



    public function update_profile(Request $request) {

      $userData=$request->all();
      $formData=$request->all();

      $imgname='';



      /*$rules = array(
          'first_name' => 'required|string',
          'last_name' => 'required|string',
          'nick_name' => 'required|string',
          'gender' => 'required',
          'address' => 'required|string|min:3',
          'day' => 'required', 
          'month' => 'required', 
          'year' => 'required',
          'email' => 'required|email', 
          'pic' => 'required',
          'phone' => 'required',
          'working_area' => 'required',
          'years_of_experience' => 'required',
          'type_of_service' => 'required',
          'branch' => 'required',
          'bank_detailed' => 'required',
          'bank_service' => 'required',
          'account_number' => 'required',
          'account_name' => 'required',
      );    
      
      $validator = Validator::make($formData, $rules);

      if ($validator->fails()) {
          return back()->withErrors($validator)->withInput();
      }

*/


      $image     =  $request->file('image');
      $document     =  $request->file('document');

      if($image != ""){
         
          $rules = array(
             'image' => 'mimes:jpeg,jpg,png,PNG,JPG,JPEG|max:3000',
          );    

          $validator = Validator::make($formData, $rules);

          if ($validator->fails()){
              $json['status'] = 'error';
              $json['message'] = $validator->errors();
              $json['status'] = 'validator_error';
              echo json_encode($json);
              exit;
          }
      }

      if($document != ""){
           $rules = array(
             'document' => 'max:5000',
          );    

          $validator = Validator::make($formData, $rules);

          if ($validator->fails()){
              $json['status'] = 'error';
              $json['message'] = $validator->errors();
              $json['status'] = 'validator_error';
              echo json_encode($json);
          }
      }
      

      if($image != ""){

          $old_image = public_path() . '/uploads/user/'.$request['hid_image'];


          if(!empty($request['hid_image'])){
              if(file_exists($old_image)){
                unlink($old_image);
              }  
          }

          $imageName = time().'.'.$image->getClientOriginalExtension();

          if(!file_exists($imageName)){

              $userArr['image'] = $imageName;

              $destinationPath = public_path() . '/uploads/user/';

              $image->move($destinationPath, $imageName);

          }

      }else {
         $userArr['image'] = $request['hid_image'];
      }


      if($document != ""){

          $old_document = public_path() . '/uploads/user/document/'.$request['hid_document'];

          if(!empty($request['hid_document'])){
            if(file_exists($old_document)){

                unlink($old_document);
            }
          }

          $documentName = time().'.'.$document->getClientOriginalExtension();

          if(!file_exists($documentName)){

              $userArr['document'] = $documentName;

              $destinationPath = public_path() . '/uploads/user/document/';

              $document->move($destinationPath, $documentName);

          }

      }else {

         $userArr['document'] = $request['hid_document'];

      }



      $data = array(
              'name'=>$userData['fname']." ".$userData['lname'],

              'first_name'=>$userData['fname'],

              'last_name'=>$userData['lname'],

              'nick_name'=>$userData['nick_name'],

              'address'=>$userData['address'],

              'dob_day'=>$userData['day'],

              'dob_month'=>$userData['month'],

              'dob_year'=>$userData['year'],

              'mobile_no'=>$userData['phone'],

              'experience'=>$userData['years_of_experience'],

      );
        $id = Auth::guard('web')->user()->id;

        $result = User::where('id',$id)->update($data);
        $userData = array(
          'therapist_id' => $id,
          'bank_service' => $request->bank_service,
          'branch' => $request->choice1,
          'account_no' => $request->account_number,
          'account_name' => $request->account_name,
        );

        DB::table('therapist_bank_detail')->insert($userData);

        if($result){
            $request->session()->flash('success','Profile changed successfully !!');
        }else{
            $request->session()->flash('error','Something went wrong !!');
        }
        return redirect('therapist/change-profile');
    }



    public function getTreatmentByCategoryId(Request $request){



        $array =  Treatment::select('id','treatment_name')->where(['is_active'=>1,'is_delete' =>0,'category_id'=>$request->id])->get();

        echo json_encode($array);

        exit;

    }



    public function view(){

        $data['therapist'] =  DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
        ->where(['users.is_active'=>'1','users.is_delete'=>'0','model_has_roles.role_id'=>2])->orderBy('id','desc')->get();

        $data['users'] =  DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
        ->where(['users.is_active'=>'1','users.is_delete'=>'0','model_has_roles.role_id'=>3])->orderBy('id','desc')->get();

        $data['massage'] =  DB::table('treatments')->where(['treatments.is_active'=>'1','treatments.is_delete'=>'0'])->orderBy('id','desc')->get();

        $data['status'] = get_status_array();

        return view('therapist.booking_list',$data);     
    }



    public function getList(Request $request){

        $where['booking.is_delete']  = 0;             

        if(!empty($request->user_filter)){
            $where['booking.user_id']  = $request->user_filter;                
        }
        if(!empty($request->massage_filter)){
            $where['booking.treatment_id']  = $request->massage_filter;                
        }
        if(!empty($request->status_filter)){
            $where['booking_activity.status']  = $request->status_filter;                
        }
   
        $login = Auth::guard('web')->user()['id'];

        $bookings = DB::table('booking')->select("booking.*","treatments.treatment_name","users.name as therapist_ame",'booking_activity.status as order_status','price_time.price',
                'price_time.time')

                    ->leftJoin('treatments','treatments.id','=','booking.treatment_id')

                    ->leftJoin('users','users.id','=','booking.user_id')

                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')

                    ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')

                    ->where('booking.therapist_id',$login)

                    ->where($where)

                    ->orderBy('booking.id',"DESC")

                    ->get();

        if(!empty($request->booking_filter)){

            if($request->booking_filter == "P"){
              
                 $bookings = DB::table('booking')->select("booking.*","treatments.treatment_name","users.name as therapist_ame",'booking_activity.status as order_status','price_time.price',
                'price_time.time')

                    ->leftJoin('treatments','treatments.id','=','booking.treatment_id')

                    ->leftJoin('users','users.id','=','booking.user_id')

                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')

                    ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')

                    ->where('booking.therapist_id',$login)

                    ->where($where)

                    ->where('booking.booking_date', '<',  date('Y-m-d'))

                    ->orderBy('booking.id',"DESC")

                    ->get();

            }
            else if($request->booking_filter == "U"){


                 $bookings = DB::table('booking')->select("booking.*","treatments.treatment_name","users.name as therapist_ame",'booking_activity.status as order_status','price_time.price',
                'price_time.time')

                    ->leftJoin('treatments','treatments.id','=','booking.treatment_id')

                    ->leftJoin('users','users.id','=','booking.user_id')

                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')

                    ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')

                    ->where('booking.therapist_id',$login)

                    ->where($where)

                    ->where('booking.booking_date', '>',  date('Y-m-d'))

                    ->orderBy('booking.id',"DESC")

                    ->get();

            }
            else if($request->booking_filter == "T"){

                 $bookings = DB::table('booking')->select("booking.*","treatments.treatment_name","users.name as therapist_ame",'booking_activity.status as order_status','price_time.price',
                'price_time.time')

                    ->leftJoin('treatments','treatments.id','=','booking.treatment_id')

                    ->leftJoin('users','users.id','=','booking.user_id')

                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')

                    ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')

                    ->where('booking.therapist_id',$login)

                    ->where($where)

                    ->where('booking.booking_date', '=',  date('Y-m-d'))

                    ->orderBy('booking.id',"DESC")

                    ->get();

            }
        }            

        return Datatables::of($bookings)

        ->addColumn('booking_date_time',function($bookings){

            $booking_date_time = date('d M-Y',strtotime($bookings->booking_date))." ".date('h:i A',strtotime($bookings->booking_time));

            return $booking_date_time;

        })

        ->addColumn('total_amount',function($bookings){

            if(!empty($bookings->total_amount)){

              $total_amount = html_entity_decode(get_currency()) . $bookings->total_amount;  

            }

            else {

              $total_amount = html_entity_decode(get_currency()) . 0;

            }

            return $total_amount;

        })

        ->addColumn('download',function($bookings){

            $bookin_id_decrypt = encrypt_decrypt_fn('encrypt',$bookings->id);

            $download = "<a href='".url('/therapist/booking-pdf/'.$bookin_id_decrypt)."'><i class='fa fa-file-pdf-o'></i> Download</a>";
            return $download;

        })

        ->addColumn('current_status',function($bookings){
            if($bookings->order_status == "N"){
                $status = '<button type="button" class="btn btn green btn-xs" data-id="'.$bookings->id.'" title="New">New</button>';
            }
            else if($bookings->order_status == "C"){
                $status = '<button type="button" class="btn btn yellow btn-xs" data-id="'.$bookings->id.'" title="Confirmed">Confirmed</button>';
            }
            else if($bookings->order_status == "M"){
                 $status = '<button type="button" class="btn green-meadow btn-xs" data-id="'.$bookings->id.'" title="Completed">Completed</button>';
            }
            else if($bookings->order_status == "L"){ 
                $status = '<button type="button" class="btn red-sunglo btn-xs" title="Cancel">Canceled</button>';
            }
            return $status;
        })

         ->addColumn('change_status',function($bookings){
          if($bookings->order_status == "N"){
            $status = '<button type="button" class="btn btn yellow btn-xs status" data-id="'.$bookings->id.'" title="Confirm" data-value="C">Confirm</button>';
          }else if($bookings->order_status == "C"){
            $status = '<button type="button" class="btn green-meadow btn-xs status" data-id="'.$bookings->id.'" title="Complete" data-value="M">Complete</button>';
          }
          else if($bookings->order_status == "M"){
               $status = '<button type="button" class="btn green-meadow btn-xs" data-id="'.$bookings->id.'" title="Completed">Completed</button>';
          }
          else if($bookings->order_status == "L"){ 
               $status = '<button type="button" class="btn red-sunglo btn-xs" title="Cancel">Canceled</button>';
          }
          return $status;
        })

        ->addColumn('duration',function($bookings){
            return $bookings->time . " Minutes";
        })

        ->rawColumns(['download','current_status','change_status','duration'])
        ->make(true);
    }

    public function generate_pdf($id){

       $id = encrypt_decrypt_fn('decrypt',$id);

       $data['booking'] = DB::table('booking')
        ->select('booking.id',
                'booking.booking_id',
                'booking.booking_date',
                'booking.booking_time',
                'booking.duration_id',
                'booking.total_amount',
                'booking.is_active',
                'booking.booking_type',
                'booking.mobile_no',
                'booking.name',
                'booking.house_no',
                'booking.street_name',
                'booking.zipcode',
                'booking.city',
                'booking.additional_notes',
                'user.name as user_name',
                'therapist.name as therapist_name',
                'treatments.treatment_name',
                'price_time.price',
                'price_time.time'
            )
        ->join('users as user', 'user.id', '=', '.booking.user_id')
        ->join('users as therapist', 'therapist.id', '=', '.booking.therapist_id')
        ->join('treatments', 'treatments.id', '=', '.booking.treatment_id')
        ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')
        ->where(['booking.id'=>$id])->first();

        /*return view('user.booking.generate_pdf',$data);*/
       
        $pdf = PDF::loadView('therapist.generate_pdf', $data);

        $fileName = date('His').'_'.$data['booking']->booking_id;
        return $pdf->download($fileName.'.pdf');
    }

    public function change_status(Request $request){
    
      $id = $request->id;
      $status = $request->status;

      DB::table('booking_activity')->where('bk_id', $id)->update(['status' => $status]);

      if($status == "C"){
        $json['status'] = 'success';
              $json['message'] = 'Status change New to Confirm';
      }else if($status == "M"){
        $json['status'] = 'success';
              $json['message'] = 'Status change Confirm to Complete';
      }
      $json['redirect'] = url('therapist/book-view'); 
      echo json_encode($json);
      exit;
    }

    /*REVIEW*/
    public function star_review(){
        $therapist = Auth::guard('web')->user()->toArray();
        $data['review']  = DB::table('booking')
        ->select('booking.*','user.name as user_name')
        ->join('users as user', 'user.id', '=', '.booking.user_id')
        ->where(['booking.therapist_id'=>$therapist['id']])
        ->whereNotNull('booking.feedback_star')
        ->get();
       return view('therapist.feedback',$data);
   }
   /*END REVIEW*/
}