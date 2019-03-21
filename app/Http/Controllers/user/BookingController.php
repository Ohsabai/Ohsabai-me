<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use Validator;
use App\User;
use Hash;
use DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use App\Region;
use App\Category;
use App\Treatment;
Use App\Booking;
use App\Helpers\Email_sender;
use PDF;
use Session;

class BookingController extends Controller
{
    
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index(Request $request){

        $data['category'] = Category::where(["is_active"=>1,"is_delete"=>0])->get();
        $data['treatments'] = Treatment::where(["is_active"=>1,"is_delete"=>0])->get();
        $data['therapists'] = User::select('users.*')->join('model_has_roles', 'model_has_roles.model_id', '=', 'users.id')->where('model_has_roles.role_id', 2)->where('users.is_active', 1)->get();
        return view("user.booking.booking_process",$data);
    }

    public function store_booking(Request $request){


        // echo "<pre>";
        // print_r($request->all());
        // exit;

        $form = $request->all();

        $booking_data = Session::get('bookig_data');
        
        if(empty($booking_data)){
            $rules = [
                'location' => 'required|string|min:2',
                'treatment'     => 'required',
                'date'     => 'required',
                'time'     => 'required',
                'therapist'     => 'required'
            ];

            $validator = Validator::make($request->all(), $rules);
            if ($validator->fails()) { 
               /*print_r($validator->errors());
               exit;*/ 
               return redirect()->back()->withErrors($validator)->withInput();   
            }
        }else {
            $form = (object)$booking_data[0];
            $request = (object)$booking_data[0];
            $request->booking_type = 0;
        }

        $login = Auth::guard('web')->user();

        $booking = Booking::create([
            'user_id' => $login->id,
            'therapist_id' => $request->therapist,
            'treatment_id' => $request->treatment,
            'booking_type' => $request->booking_type,
            'duration_id' => $request->duration,
            'booking_date' => date('Y-m-d',strtotime($request->date)),
            'booking_time' => $request->time.":00",
            'mobile_no' => $request->mobile,
            'name' => $request->name,
            'house_no' => $request->house_no,
            'street_name' => $request->street,
            'zipcode' => $request->post_code,
            'city' => $request->city,
            'total_amount' => $request->total,
            'additional_notes' => $request->additional_notes,
            'is_active' => 1,
            'term_condition'=>1
        ]);


        $id = DB::getPdo()->lastInsertId();
        
        DB::table('booking_activity')->insert([
            'bk_id' => $id
        ]);
        /*Generate Booking id*/

        /*End booking id*/
        $id = $booking->id;

        $booking_id = booking_id($id);

        Booking::where("id",$id)->update(["booking_id"=>$booking_id]);

        $booking_array = Booking::where("id",$id)->first();

        $treatment = Treatment::where('id',$booking_array->treatment_id)->first();

        $therapist = User::where('id',$booking_array->therapist_id)->first();

        $admin = User::where('id',1)->first();

        $emailArray = [
            'name'         => ucfirst($login->name),
            'email'        => $login->email,
            'total_amount' => $request->total,
            'treatment_name' => $treatment->treatment_name,
            'therapist_name' => $therapist->name,
            'duration_id' => $request->duration,
            'booking_date' => date('Y-m-d',strtotime($request->date)),
            'booking_time' => $request->time.":00",
            'booking_id' => $booking_array->booking_id,
            'mobile_no' => $request->mobile,
            'name' => $request->name,
            'house_no' => $request->house_no,
            'street_name' => $request->street,
            'zipcode' => $request->post_code,
            'city' => $request->city,
        ];

        Email_sender::bookingEmailSentToUser($emailArray,'user',$login->email);
        Email_sender::bookingEmailSentToUser($emailArray,'therapist',$therapist->email);
        Email_sender::bookingEmailSentToUser($emailArray,'admin',$admin->email);

        if(empty($booking_data)){
            $request->session()->flash('success','Booked successfully,Please check your email.');
        }else{
            $request->session()->flash('success','Booked successfully,Please check your email.');
        }
        return redirect('user/book-view');
    }

    public function edit($id){

        $id = encrypt_decrypt_fn('decrypt',$id);
        $data['category'] = Category::where(["is_active"=>1,"is_delete"=>0])->get();
        $data['treatments'] = Treatment::where(["is_active"=>1,"is_delete"=>0])->get();
        $data['therapists'] = User::select('users.*')->join('model_has_roles', 'model_has_roles.model_id', '=', 'users.id')->where('model_has_roles.role_id', 2)->get();

        $data['booking'] = DB::table('booking')
                            ->select('booking.*',
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

        $data['price_time'] =  DB::table('price_time')->where('treatments_id',$data['booking']->treatment_id)->get();
        return view("user.booking.booking_process_edit",$data);
    }

    public function edit_booking(Request $request){


        $request->validate([
            'location' => 'required|string|min:2',
            'treatment'     => 'required',
            'duration'     => 'required',
            'date'     => 'required',
            'time'     => 'required',
            'therapist'     => 'required'
        ]);

        $formData = $request->all();

        $login = Auth::guard('web')->user();

        $booking = Booking::where('id',$request->id)->update([
            'user_id' => $login->id,
            'therapist_id' => $request->therapist,
            'treatment_id' => $request->treatment,
            'booking_type' => $request->booking_type,
            'duration_id' => $request->duration,
            'booking_date' => date('Y-m-d',strtotime($request->date)),
            'booking_time' => $request->time.":00",
            'mobile_no' => $request->mobile,
            'name' => $request->name,
            'house_no' => $request->house_no,
            'street_name' => $request->street,
            'zipcode' => $request->post_code,
            'city' => $request->city,
            'total_amount' => $request->total,
            'additional_notes' => $request->additional_notes,
            'is_active' => 1
        ]);

        $request->session()->flash('success','Booking Update successfully');
        return redirect('user/book-view');
    }

    public function view_booking($id){

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
        ->where(['booking.id'=>$id])->first();
        return view('user.booking.view',$data);
    }

    public function view(){
        return view('user.booking.booking_list');
    }

    public function getList(){

        $login = Auth::guard('web')->user()['id'];
        $bookings = DB::table('booking')->select("booking.*","treatments.treatment_name","users.name as therapist_ame","booking_activity.status as order_status","price_time.time")
                    ->leftJoin('treatments','treatments.id','=','booking.treatment_id')
                    ->leftJoin('users','users.id','=','booking.therapist_id')
                    ->leftjoin('booking_activity', 'booking_activity.bk_id', '=', '.booking.id')
                    ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')
                    ->where('booking.user_id',$login)
                    ->where('booking.is_delete',0)
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

            $edit = '<a href="' . route('user.edit_book_order', encrypt_decrypt_fn('encrypt',$bookings->id)) . '" class="btn green-meadow btn-sm"><i class="fa fa-pencil"></i></a>';

            $view  = '<a class="btn blue view btn-sm" href="' . route('user.view_book_order', encrypt_decrypt_fn('encrypt',$bookings->id)) . '"><i class="fa fa-eye"></i></a>';

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

    public function getPricetimeByTreatment(Request $request){

        $price_time =  DB::table('price_time')->where("treatments_id",$request->id)->get();
        
        if(!empty($request->type) && $request->type == 1){
            foreach ($price_time as  $pt) { ?>
             <div class="duration_time_div">
                <div class="md-radio">
                  <input type="radio" class="md-radiobtn duration"  id='duration1_<?php echo $pt->id; ?>' name="duration1" data-price='<?php echo $pt->price; ?>' value='<?php echo $pt->id; ?>' data-id="1">
                  <label for='duration1_<?php echo $pt->id; ?>'>
                  <span></span>
                  <span class="check"></span>
                  <span class="box"></span> <?php echo $pt->time; ?> Minutes
                  </label>
                </div>
            </div>
            <?php }
         }
        else {
            foreach ($price_time as  $pt) { ?>
             <div class="duration_time_div">
                <div class="md-radio">
                  <input type="radio" class="md-radiobtn duration"  name="duration" data-price='<?php echo $pt->price; ?>' value='<?php echo $pt->id; ?>' id='duration_<?php echo $pt->id; ?>' data-id="1">
                  <label for='duration_<?php echo $pt->id; ?>'>
                  <span></span>
                  <span class="check"></span>
                  <span class="box"></span> <?php echo $pt->time; ?> Minutes
                  </label>
                </div>
            </div>
            <?php } 
        exit;
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
                'price_time.time'

            )
        ->join('users as user', 'user.id', '=', '.booking.user_id')
        ->join('users as therapist', 'therapist.id', '=', '.booking.therapist_id')
        ->join('treatments', 'treatments.id', '=', '.booking.treatment_id')
        ->leftjoin('price_time', 'price_time.id', '=', '.booking.duration_id')
        ->where(['booking.is_delete'=>'0','booking.id'=>$id])->first();

        $pdf = PDF::loadView('user.booking.generate_pdf', $data);

        $fileName = date('His').'_'.$data['booking']->booking_id;
        return $pdf->download($fileName.'.pdf');
    }

    public function cancel_booking($id){
        
        $result = DB::table('booking_activity')->where('bk_id','=',$id)->update(['status'=>"L"]);

        if($result == 1){
            $json['status'] = 'success';
            $json['message'] = 'cancel successfully!';
            $json['redirect'] = url('user/book-view'); 
        }else{
            $json['status'] = 'error';
            $json['message'] = 'Something went wrong!';
        }
        echo json_encode($json);
        exit;
    }

    public function feedback($id){

        $data['id'] = $id;

        $query = DB::table('booking')
        ->where(['booking.id'=>$id])->first();

        $data['feedback_data'] =  $query;

        return view('user.feedback',$data);
    }

    public function store_feedback(Request $request){

        if($request->rating_star == 0){
             echo "error";    
        }
        else {

            DB::table('booking')->where('id','=', $request->id)->update(['feedback_star'=>$request->rating_star,'feedback_desc'=>$request->rating_desc]);
            echo "save";
        }       
        exit;
    }

    public function getTreatmentNameById(Request $request){

        if(!empty($request->id)){
           $treatments =  DB::table('treatments')->where('id','=', $request->id)->first();
           return $treatments->treatment_name;
        }
    }

}