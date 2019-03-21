<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;
use App\Helpers\Email_sender;
use App\Booking;
use PDF;

class BookingController extends Controller
{
    public function index(){

        $data['therapist'] =  DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
        ->where(['users.is_active'=>'1','users.is_delete'=>'0','model_has_roles.role_id'=>2])->orderBy('id','desc')->get();

        $data['users'] =  DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
        ->where(['users.is_active'=>'1','users.is_delete'=>'0','model_has_roles.role_id'=>3])->orderBy('id','desc')->get();

        $data['massage'] =  DB::table('treatments')->where(['treatments.is_active'=>'1','treatments.is_delete'=>'0'])->orderBy('id','desc')->get();

        $data['status'] = get_status_array();

    	return view('admin.booking.list',$data);
    }

    public function getList(Request $request){

        $where['booking.is_delete']  = 0;             

        if(!empty($request->therapist_filter)){
            $where['booking.therapist_id']  = $request->therapist_filter;                
        }

        if(!empty($request->user_filter)){
            $where['booking.user_id']  = $request->user_filter;                
        }
        if(!empty($request->massage_filter)){
            $where['booking.treatment_id']  = $request->massage_filter;                
        }
        if(!empty($request->status_filter)){
            $where['booking_activity.status']  = $request->status_filter;                
        }
   
        $bookings = DB::table('booking')->select('booking.id','booking_id','user.name as user_name','therapist.name as therapist_name','booking.booking_date','booking.booking_time','booking.total_amount','treatments.treatment_name','booking.is_active','booking_activity.status as order_status','price_time.price',
                'price_time.time')
        ->join('users as user', 'user.id', '=', '.booking.user_id')
        ->join('users as therapist', 'therapist.id', '=', '.booking.therapist_id')
        ->join('treatments', 'treatments.id', '=', '.booking.treatment_id')
        ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')
        ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')
        ->where($where)->orderBy('booking.id','desc')->get();

         if(!empty($request->booking_filter)){

            if($request->booking_filter == "P"){

                $bookings = DB::table('booking')->select('booking.id','booking_id','user.name as user_name','therapist.name as therapist_name','booking.booking_date','booking.booking_time','booking.total_amount','treatments.treatment_name','booking.is_active','booking_activity.status as order_status','price_time.price',
                'price_time.time')
                    ->join('users as user', 'user.id', '=', '.booking.user_id')
                    ->join('users as therapist', 'therapist.id', '=', '.booking.therapist_id')
                    ->join('treatments', 'treatments.id', '=', '.booking.treatment_id')
                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')
                    ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')
                    ->where($where)->where('booking.booking_date', '<',  date('Y-m-d'))->orderBy('booking.id','desc')->get();

            }
            else if($request->booking_filter == "U"){

                $bookings = DB::table('booking')->select('booking.id','booking_id','user.name as user_name','therapist.name as therapist_name','booking.booking_date','booking.booking_time','booking.total_amount','treatments.treatment_name','booking.is_active','booking_activity.status as order_status','price_time.price',
                'price_time.time')
                    ->join('users as user', 'user.id', '=', '.booking.user_id')
                    ->join('users as therapist', 'therapist.id', '=', '.booking.therapist_id')
                    ->join('treatments', 'treatments.id', '=', '.booking.treatment_id')
                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')
                    ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')
                    ->where($where)->where('booking.booking_date', '>',  date('Y-m-d'))->orderBy('booking.id','desc')->get();
            }
            else if($request->booking_filter == "T"){

                $bookings = DB::table('booking')->select('booking.id','booking_id','user.name as user_name','therapist.name as therapist_name','booking.booking_date','booking.booking_time','booking.total_amount','treatments.treatment_name','booking.is_active','booking_activity.status as order_status','price_time.price',
                'price_time.time')
                    ->join('users as user', 'user.id', '=', '.booking.user_id')
                    ->join('users as therapist', 'therapist.id', '=', '.booking.therapist_id')
                    ->join('treatments', 'treatments.id', '=', '.booking.treatment_id')
                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')
                    ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')
                    ->where($where)->where('booking.booking_date', '=',  date('Y-m-d'))->orderBy('booking.id','desc')->get();
            }
        }

        return Datatables::of($bookings)


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
                $status = '<button type="button" class="btn red-sunglo btn-xs" title="Canceled">Canceled</button>';
            }
            return $status;
        })
        
        ->addColumn('booking_date',function($bookings){
            $booking_date = date('d M-Y',strtotime($bookings->booking_date))." ".date('h:i A',strtotime($bookings->booking_time));
            return $booking_date;
        })
        ->addColumn('total_amount',function($bookings){
            
            if(!empty($bookings->total_amount)){
                $total_amount =  html_entity_decode(get_currency()) . $bookings->total_amount;
            }
            else {
                $total_amount =  html_entity_decode(get_currency()) . 0;   
            }
            return $total_amount;
        })
        ->addColumn('action',function($bookings){
            $delete  = '<a href="javascript:;" data-id = "'.$bookings->id.'" class="btn red-sunglo btn-sm delete btn_shadow"><i class="fa fa-trash"></i></a>';


            $view = '<a class="btn blue view btn-sm" href="'.route("admin.booking.view",encrypt_decrypt_fn('encrypt',$bookings->id)).'"><i class="fa fa-eye"></i></a>';

            $actions    = $delete . $view;
            return $actions;
        })
        ->addColumn('download',function($bookings){

            $bookin_id_decrypt = encrypt_decrypt_fn('encrypt',$bookings->id);

            $download = "<a href='".url('/admin/booking-pdf/'.$bookin_id_decrypt)."'><i class='fa fa-file-pdf-o'></i> Download</a>";
            return $download;

        })

        ->addColumn('duration',function($bookings){
            if(!empty($bookings->time)){
                return $bookings->time . " Minutes";
            }
            else {
                return "-";
            }
            
        })
        ->rawColumns(['status','action','download','change_status','current_status','duration'])
        ->make(true);
    }

    public function create(){
    	return view('admin.therapist.create');	
    }

    public function store(Request $request){

     if ($request->isMethod('post')) {

	    	$request->validate([
	            'name' => 'required|string|min:3',
	            'email' => 'required',
	            'mobile' => 'required',
	            'address' => 'required',
	            'lat' => 'required',
	            'long' => 'required',
	            'distance' => 'required',
	            'password' => 'required',
	        ]);

	        $formData = $request->all();

	        $user = User::where(['email'=>$request->email,'is_delete'=>0])->first();

            $token = md5(rand(00000,99999));
        
	        if(empty($user)){

                $cusers = User::create([
                    'name' => $request->name,
                    'email' => $request->email,
                    'mobile_no' => $request->mobile,
                    'address' => $request->address,
                    'lat' => $request->lat,
                    'lng' => $request->long,
                    'distance' => $request->distance,
                    'password' => bcrypt($request->password),
                    'remember_token' => $token,
                    'is_active' => 0,
                    'term_condition'=>1
                ]);

                $id = $cusers->id;

                $user = User::find($id);
                $role = Role::find(2);
                $user->roles()->attach($role);

                $email_data = [
                    'name'      => ucfirst($user->name),
                    'email'     => $user->email,
                    'url'       => url('verify-account/'.$user->remember_token)
                ];

                Email_sender::userVerificationEmail($email_data);

		        if($cusers){
		            $json['status'] = 'success';
		            $json['message'] = 'Saved successfully !';
		            $json['redirect'] = url('admin/list-therapist');    
		        }else{
		            $json['status'] = 'error';
		            $json['message'] = 'Something went wrong !!';
		        }
	        }else{
	        	$json['status'] = 'warning';
		        $json['message'] = 'User already exist !!';
	        }

	        echo json_encode($json);
		    exit;
        }	
    }

    public function change_status(Request $request){
		
		$id = $request->id;
		$status = $request->status;

        DB::table('booking_activity')
            ->where('bk_id', $id)
            ->update(['status' => $status]);


		if($status == "C"){
			$json['status'] = 'success';
            $json['message'] = 'Status change New to Confirm';
		}else if($status == "M"){
			$json['status'] = 'success';
            $json['message'] = 'Status change Confirm to Complete';
		}
		$json['redirect'] = url('admin/list-bookings'); 
		echo json_encode($json);
		exit;
    }

    public function delete(Request $request){
		
		$id = $request->id;

		$result = Booking::where('id','=',$id)->update(['is_delete'=>1]);

		if($result == 1){
			$json['status'] = 'success';
            $json['message'] = 'Deleted successfully!';
            $json['redirect'] = url('admin/list-bookings'); 
		}else{
			$json['status'] = 'error';
            $json['message'] = 'Something went wrong!';
		}
		echo json_encode($json);
		exit;
    }

    public function edit($id){
    	
        $id = encrypt_decrypt_fn('decrypt',$id);
    	$data['user'] = User::findOrFail($id);

    	if($id == 1){
    		session()->flash('error', 'User does not exist !!');
    		return redirect("admin/list-therapist");
    	}
	    return view('admin.therapist.edit',$data);	
    }

    public function edit_store(Request $request){

     if ($request->isMethod('post')) {

    	$request->validate([
            'name' => 'required|string|min:3',
            'email' => 'required|email',
            'mobile' => 'required',
            'address' => 'required',
            'lat' => 'required',
            'long' => 'required',
            'distance' => 'required',
        ]);

    	$cusers = array(
        	'name' => $request->name,
            'email' => $request->email,
            'mobile_no' => $request->mobile,
            'address' => $request->address,
            'lat' => $request->lat,
            'lng' => $request->long,
            'distance' => $request->distance,
            'password' => bcrypt($request->password),
            'is_active' => 1
    	);

    	$cusers = User::where('id',$request->id)->update($cusers);

        if($cusers){
            $json['status'] = 'success';
            $json['message'] = 'Updated successfully !';
            $json['redirect'] = url('admin/list-therapist');    
        }else{
            $json['status'] = 'error';
            $json['message'] = 'Something went wrong !!';
        }
        echo json_encode($json);
	    exit;
    }	
  }

  public function view($id){

      $id = encrypt_decrypt_fn('decrypt',$id);

     $data['bookings'] = $bookings = DB::table('booking')->select('booking.id','booking_id','user.name as user_name','therapist.name as therapist_name' ,'booking.*','treatments.treatment_name','booking.is_active',
         'price_time.price',
         'price_time.time')
        ->join('users as user', 'user.id', '=', '.booking.user_id')
        ->join('users as therapist', 'therapist.id', '=', '.booking.therapist_id')
        ->join('treatments', 'treatments.id', '=', '.booking.treatment_id')
        ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')
        ->where('booking.id',$id)
        ->first();                

    return view('admin.booking.view',$data);                
  }

  public function generate_pdf($id){

        $id = encrypt_decrypt_fn('decrypt',$id);

        $data['booking'] = DB::table('booking')
        ->select('booking.id',
                'booking.booking_id',
                'booking.booking_date',
                'booking.booking_time',
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
        ->where(['booking.is_delete'=>'0','booking.id'=>$id])->first();

        /*return view('user.booking.generate_pdf',$data);*/
        
        $pdf = PDF::loadView('admin.booking.generate_pdf', $data);

        $fileName = date('His').'_'.$data['booking']->booking_id;
        return $pdf->download($fileName.'.pdf');
  }
}
