<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Validator;
use App\User;
use Hash;
use DB;
use Yajra\Datatables\Datatables;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use App\Region;
use App\Category;
use Session;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
        header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
        header("Cache-Control: post-check=0, pre-check=0", false);
        header("Pragma: no-cache");
    }
/**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      
       return view('user.home');
    }

    public function getList(Request $request){

        $login = Auth::guard('web')->user()['id'];
        $bookings = DB::table('booking')->select("booking.*","treatments.treatment_name","users.name as therapist_ame","booking_activity.status as order_status","price_time.time")
                    ->leftJoin('treatments','treatments.id','=','booking.treatment_id')
                    ->leftJoin('users','users.id','=','booking.therapist_id')
                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')
                    ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')
                    ->where('booking.user_id',$login)
                    ->where('booking.is_delete',0)
                    ->take(5)
                    ->orderBy('booking.id',"DESC")
                    ->get();

        
        return Datatables::of($bookings)

        ->addColumn('booking_date_time',function($bookings){
            $booking_date_time = date('d M-Y',strtotime($bookings->booking_date))." ".date('h:i A',strtotime($bookings->booking_time));
            return $booking_date_time;
        })
        ->addColumn('download',function($bookings){

            $bookin_id_decrypt = encrypt_decrypt_fn('encrypt',$bookings->id);

            $download = "<a href='".url('booking-pdf/'.$bookin_id_decrypt)."'><i class='fa fa-file-pdf-o'></i> Download</a>";
            return $download;
        })

        ->addColumn('actions',function($bookings){
            if(!empty($bookings->total_amount)){
              $actions = html_entity_decode(get_currency()) . $bookings->total_amount;  
            }
            else {
              $actions = html_entity_decode(get_currency()) . 0;
            }

            $edit = '<a href="' . route('user.edit_book_order', $bookings->id) . '" class="btn green-meadow btn-sm"><i class="fa fa-pencil"></i></a>';

            $view  = '<a class="btn blue view btn-sm" href="' . route('user.view_book_order', $bookings->id) . '"><i class="fa fa-eye"></i></a>';

            $cancel = '<br /><br /><button class="btn red-sunglo btn-sm cancel_delete btn_shadow" data-id="5" data-url="' . route('user.cancel_book_order', $bookings->id) . '">cancel</button>';

            if($bookings->order_status == "L" || $bookings->order_status == "C" || $bookings->order_status == "M"){
                $cancel = '';
                $edit = '';
            }

            $feedback = "";
            if($bookings->order_status == "M"){
                $feedback = '<br /><br /><a class="btn blue view btn-sm" href="' . route('user.feedback', $bookings->id) . '">Feedback</a>';
            }
            return $edit . "". $view . "" . $cancel . "" . $feedback;
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

        ->addColumn('current_status',function($bookings){

            if($bookings->order_status == "N"){
                $status = '<button type="button" class="btn btn green btn-xs" data-id="'.$bookings->id.'" title="New">New</button>';
            }else if($bookings->order_status == "C"){
                $status = '<button type="button" class="btn btn yellow btn-xs" data-id="'.$bookings->id.'" title="Confirmed">Confirmed</button>';
            }
            else if($bookings->order_status == "M"){
                 $status = '<button type="button" class="btn green-meadow btn-xs" data-id="'.$bookings->id.'" title="Completed">Completed</button>';
            }
            else if($bookings->order_status == "L"){
                $status = '<button type="button" class="btn red-sunglo btn-xs" title="Canceled">Canceled</button>';
            }
            return $status;
        })


        ->addColumn('duration',function($bookings){
            return $bookings->time . " Minutes";
        })

        ->rawColumns(['booking_date_time','download','actions','total_amount','current_status','duration'])
        ->make(true);
    }

    public function change_profile(){
       $data['region'] = Region::where(["is_active"=>1,"is_delete"=>0])->get();
       $data['val'] = Auth::guard('web')->user();
       return view('user.change_profile',$data);
    }
    public function update_profile(Request $request) {

      $userData=$request->all();
 
      $imgname='';
      
      $request->validate([
        'image' => 'mimes:jpeg,jpg,png,PNG,JPG,JPEG|max:3000',
        'name' => 'required|string|min:3',
        'email' => 'required',
        'city' => 'required',
        'mobile' => 'required',
        'address' => 'required',
      ]);
      $image     =  $request->file('image');

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

      $data = array(
              'name' =>$userData['name'],
              'email' =>$userData['email'],
              'region_id' =>$userData['city'],
              'mobile_no' =>$userData['mobile'],
              'address' =>$userData['address'],
              'lat' =>$userData['lat'],
              'lng' =>$userData['long'],
              'image' => $userArr['image'],
             
       );

        $id = Auth::guard('web')->user()->id;
   
        $result = User::where('id',$id)->update($data);
    
        if($result){
            $request->session()->flash('success','Profile changed successfully !!');
        }else{
            $request->session()->flash('error','Something went wrong !!');
        }
        return redirect('user/change-profile');

   
    }


    public function change_password(Request $request){
        return view('user.change_password');
    }

    public function update_password(Request $request){

        if (!(Hash::check($request->get('old_password'), Auth::user()->password))) {
          return redirect()->back()->with("error","Your current password does not matches with the password you provided. Please try again.");
        }

        if(strcmp($request->get('old_password'), $request->get('password')) == 0){
          return redirect()->back()->with("error","New Password cannot be same as your current password. Please choose a different password.");
        }

        if($request->password != $request->password_confirmation){
          return redirect()->back()->with("error","password and password confirmation are not same");
        }
        
        $request->validate([
            'old_password' => 'required',
            'password' => 'required|string|min:6',
            'password_confirmation' => 'required'
        ]);

        $password  = bcrypt($request->password);
        $result = DB::table('users')->where("id",Auth::guard("web")->user()->id)->update(['password' => $password]);
        
        if($result){
            $request->session()->flash('success',"Reset Password successfully");
        }else {
            $request->session()->flash('error',"Something went wrong !!");
        }
        return redirect('user/change-password');
    }

    public function location(Request $request){
        return view("user.booking.location");
    }

    public function choose_category(Request $request){
        $category = Category::where(["is_active"=>1,"is_delete"=>0])->get();
        return $category;
    }
  
}