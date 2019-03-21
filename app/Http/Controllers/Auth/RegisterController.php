<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Role;
use Auth;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use App\Helpers\Email_sender;
use App\Region;
use App\Category;
use App\Treatment;
use DB;

class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|min:6|confirmed',
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *
     * @param  array  $data
     * @return \App\User
     */

    public function signup(){
        $data['region'] = Region::where(['is_active'=>1,'is_delete' =>0])->get();
        return view('user.register',$data);
    }

    public function create(Request $request){

        $request->validate([
            'name'                  => 'required|string|min:2',
            'email'                 => 'required|email|unique:users',
            'mobile'                => 'required',
            'address'               => 'required',
            'lat'                   => 'required',
            'long'                   => 'required',
            'password'              => 'required',
            'cpassword'             => 'required',
            'city'                  => 'required'
        ]);

        $formData = $request->all();

        $token = md5(rand(00000,99999));
        
        $formData['password'] = Hash::make($formData['password']);
        $user = new User();
        $user->name           = $formData['name'];
        $user->email          = $formData['email'];
        $user->region_id      = $formData['city'];
        $user->mobile_no      = $formData['mobile'];
        $user->address        = $formData['address'];
        $user->lat            = $formData['lat'];
        $user->lng            = $formData['long'];
        $user->password       = $formData['password'];

        $user->remember_token = $token;
        $user->is_delete    = 0;
        $user->is_active    = 0;
        $user->save();

        $role = Role::find(3);
        $user->roles()->attach($role);

        $emailArray = [
            'name'      => ucfirst($user->name),
            'email'     => $user->email,
            'url'       => url('verify-account')."/".$user->remember_token
        ];
        Email_sender::userVerificationEmail($emailArray);
        
        $request->session()->flash('success','Account has been created, Please check your email.');
        return redirect('login');

    }

    public function verifyAccount($token,Request $request){
        if($token != ""){
            $user = User::where('remember_token','=',$token)->where('is_delete','=','0')->first();
            if($user){
                $user->is_active        = 1;
                $user->remember_token   = "";
                $user->email_verified_at = date('Y-m-d H:i:s');
                $user->save();

                $request->session()->flash('success','Account verified successfully,Please login from here');
            }else{
                $request->session()->flash('error','Token is expired!');
            }
        }else{
            $request->session()->flash('error','Token not found!');
        }
        return redirect('login');
    }

    public function therapist_apply_now(){
        return view('therapist.apply_now');
    }

    public function therapist_signup(){
        $data['region'] = Region::where(['is_active'=>1,'is_delete' =>0])->get();
        $data['treatment'] = Treatment::where(['is_active'=>1,'is_delete' =>0])->get();
        return view('therapist.register',$data);
    }


    public function therapist_create(Request $request){

        $validator = Validator::make($request->all(), [
            'first_name' => 'required|string|min:3',
            'last_name' => 'required|string|min:3',
            'nick_name' => 'required|string|min:3',
            'email' => 'required|email|unique:users',
            'mobile' => 'required',
            'address' => 'required',
            'working_area' => 'required',
            'experience' => 'required',
            'treatment_name' => 'required',
            'password' => 'required|min:6|confirmed',

        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $formData = $request->all();

        $token = md5(rand(00000,99999));

        $customIdCard = "";
        if (!empty($request->file('id_card'))) {
            $id_card            = $request->file('id_card');
            $customIdCard  = time() . '.' . $id_card->getClientOriginalExtension();
            $destinationIdCardPath = public_path() . '/uploads/id_card/';
            $id_card->move($destinationIdCardPath, $customIdCard);
        }

        $customCertificate = "";
        if (!empty($request->file('certificate'))) {
            $certificate            = $request->file('certificate');
            $customCertificate  = time() . '.' . $certificate->getClientOriginalExtension();
            $destinationCertificatePath = public_path() . '/uploads/certificate/';
            $certificate->move($destinationCertificatePath, $customCertificate);
        }

        $customBookBank = "";
        if (!empty($request->file('book_bank'))) {
            $book_bank            = $request->file('book_bank');
            $customBookBank  = time() . '.' . $book_bank->getClientOriginalExtension();
            $destinationBookBankPath = public_path() . '/uploads/book_bank/';
            $book_bank->move($destinationBookBankPath, $customBookBank);
        }

        $customHouseReg = "";
        if (!empty($request->file('house_reg'))) {
            $house_reg            = $request->file('house_reg');
            $customHouseReg  = time() . '.' . $house_reg->getClientOriginalExtension();
            $destinationHouseReg = public_path() . '/uploads/house_reg/';
            $house_reg->move($destinationHouseReg, $customHouseReg);
        }

        $customRecentPhoto = "";
        if (!empty($request->file('recent_photo'))) {
            $recent_photo            = $request->file('recent_photo');
            $customRecentPhoto  = time() . '.' . $recent_photo->getClientOriginalExtension();
            $destinationRecentPhotoPath = public_path() . '/uploads/recent_photo/';
            $recent_photo->move($destinationRecentPhotoPath, $customRecentPhoto);
        }

        $user = new User();

        $user->name = $request->first_name." ".$request->last_name;
        $user->first_name = $request->first_name;
        $user->last_name  = $request->last_name;
        $user->nick_name  = $request->nick_name;
        $user->email = $request->email;
        $user->password   = Hash::make($request->password);
        $user->mobile_no = $request->mobile;
        $user->address = $request->address;
        $user->experience = $request->experience;

        $user->id_card = $customIdCard;
        $user->certification = $customCertificate;
        $user->book_bank = $customBookBank;
        $user->house_reg = $customHouseReg;
        $user->recent_photo = $customRecentPhoto;

        $user->remember_token = $token;
        $user->is_active    = 0;
        $user->term_condition = 1;

        $userData = $user->save();


        $id = DB::getPdo()->lastInsertId();


        
        foreach ($request->working_area as  $working_area) {

               DB::table('therapist_working_area')->insert(
                      ['therapist_id' => $id,
                       'area_id' => $working_area
                    ]
                ); 
        }

        foreach ($request->treatment_name as  $treatment_name) {

                DB::table('therapist_services')->insert(
                      ['therapist_id' => $id,
                       'service_id' => $treatment_name
                    ]
                ); 
        }

        $role = Role::find(2);
        $user->roles()->attach($role);
        $emailArray = [
            'name'      => ucfirst($user->name),
            'email'     => $user->email,
            'url'       => url('verify-account')."/".$user->remember_token
        ];
        Email_sender::userVerificationEmail($emailArray);
        $request->session()->flash('success','Account has been created, Please check your email.');
        return redirect('login');
    }
}
