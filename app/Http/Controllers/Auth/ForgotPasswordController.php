<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use DB;
use App\Helpers\Email_sender;
use Validator;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        /*$this->middleware('guest');*/
    }

    public function forgot_password_form(){
        return view('auth.passwords.forgot_password');
    }

    public function forgot_password(Request $request){

        $request->validate([
            'email' => 'required',
        ]);

        $check_user = User::where(['email'=>$request->email,'is_delete'=>0])->first();

        if(!empty($check_user)){

        $token = md5(rand(00000,99999));

        User::where('email',$request->email)->update(['reset_password_token' => $token]);

        $url = url('/user/reset-password/'.$token);

        Email_sender::sendUserForgotPasswordEmail(['name'=>$check_user->name,'url'=>$url,'email'=>$check_user->email]);

        session()->flash('success','Password reset link has been sent to your email!');
           
        }else{
        session()->flash('error','User not found!');
        }

        return redirect('login');
    }

    public function reset_password($token= NULL){
        $check_user = User::where(['reset_password_token'=>$token,'is_delete'=>0])->first();

        if(empty($check_user)){
            session()->flash('error','Token Expired');
            return redirect('/login');    
        }

        $data['token'] = isset($token)?($token):"";
        return view('auth.passwords.reset',$data);
    }

    public function set_password(Request $request){
        
         $validator = Validator::make($request->all(), [
            'reset_token' => 'required',
            'password' => 'required|min:6|confirmed',
            'password_confirmation' => 'required|min:6'
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        if(empty($request->reset_token)){
           session()->flash('error','Token Expired');
           return redirect('/login');
        }

        $check_user = User::where(['reset_password_token'=>$request->reset_token,'is_delete'=>0])->first();

        if(!empty($check_user)){

            $result = User::where('id',$check_user->id)->update(['password' => bcrypt($request->password)]);

           User::where('id',$check_user->id)->update(['reset_password_token' => '']);

           session()->flash('success','Password reset successfully!');
           return redirect('/login');
            
        }else{
           session()->flash('error','User not found!');
           return redirect('/login');
        }

        echo json_encode($json);
        exit;
    }
}
