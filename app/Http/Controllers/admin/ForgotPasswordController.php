<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use DB;
use App\Helpers\Email_sender;

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
        $this->middleware('guest:admin');
    }

    public function forgot_password(Request $request){

        $request->validate([
            'email' => '',
        ]);

        $check_user = User::where(['email'=>$request->email,'is_delete'=>0,'id'=>1])->first();

        if(!empty($check_user)){

        $token = md5(rand(00000,99999));

        User::where('email',$request->email)->update(['reset_password_token' => $token]);

        $url = url('/admin/reset-password/'.$token);

        Email_sender::sendAdminForgotPasswordEmail(['name'=>$check_user->name,'url'=>$url,'email'=>$check_user->email]);

            $json['status'] = 'success';
            $json['message'] = 'Link Send Your Email Address !!';
            $json['reload'] = 'true';
            
        }else{
            $json['status'] = 'error';
            $json['message'] = 'User Not Found !!';
        }

        echo json_encode($json);
        exit;
    }

    public function reset_password($token= NULL){

         $check_user = User::where(['reset_password_token'=>$token,'is_delete'=>0])->first();

        if(empty($check_user)){
            session()->flash('error','Token Expired');
            return redirect('admin/login');    
        }

        $data['token'] = isset($token)?($token):"";
        return view('admin.reset_password',$data);
    }

    public function set_password(Request $request){

        $request->validate([
            'password' => 'required',
        ]);

        if(empty($request->reset_token)){
            $json['status'] = 'error';
            $json['message'] = 'Token Expired !!';
            $json['redirect'] = url('admin/login');
        }

        $check_user = User::where(['reset_password_token'=>$request->reset_token,'is_delete'=>0])->first();

        if(!empty($check_user)){

            $result = User::where('id',$check_user->id)->update(['password' => bcrypt($request->password)]);

            User::where('id',$check_user->id)->update(['reset_password_token' => '']);                

            $json['status'] = 'success';
            $json['message'] = 'Password Change Successfully !!';
            $json['redirect'] = url('admin/login');
        }else{
            $json['status'] = 'error';
            $json['message'] = 'User Not Found !!';
        }

        echo json_encode($json);
        exit;
    }


}
