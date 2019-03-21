<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use App\User;
use Auth;
use Validator;
use Session;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function showLoginForm()
    {
        return view("auth.login");
    }

    public function login(Request $request){

        $request->validate([
            'email'     => 'required|email|max:55',
            'password'  => 'required|string',
        ]);

        $formData = $request->all();

        $user = User::where('email','=',$formData['email'])->whereNotIn('id',['1'])->first();

        if(!empty($user)){

            if($user->is_active == 0){
                session()->flash('error','You are temporary disabled!');
                return redirect('login');
            }else{
                $role_id = User::getRole($user->id);       

                if($role_id == 0){
                    session()->flash('error','User does not exist!');
                    return redirect('login');
                }         
                
                $credentials = [
                    'email'     => $formData['email'],
                    'password'  => $formData['password'],
                    'is_active' => 1,
                    'is_delete' => 0
                ];

                $authSuccess = Auth::attempt($credentials,true);

                if($authSuccess){
                    if($role_id == 2){
                        session()->flash('success','Login Succesfully!');
                        return redirect('therapist/dashboard');
                    }else{
                        session()->flash('success','Login Succesfully!');

                        $booking_data = Session::get('bookig_data');
                        if(!empty($booking_data)) {
                            return redirect('user/store-book-order');     
                        }
                        else {
                            return redirect('user/dashboard');  
                        }
                    }
                    
                }else{
                    session()->flash('error','These credentials do not match our records!');
                    return redirect('login');
                }
            }
        }else{
             session()->flash('error','User does not exist!');
            return redirect('login');
        }
    }
}
