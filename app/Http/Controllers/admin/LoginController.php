<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use Validator;

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
    protected $redirectTo = 'admin/dashboard';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest:admin')->except('logout');
    }

     public function showLoginForm()
    {
        return view('admin.login');
    }

    public function login(Request $request){
        
        $validator = Validator::make($request->all(), [
            'email'     => 'required|email|max:55',
            'password'  => 'required|string',
        ]);

        if ($validator->fails()) {
            return back()->withErrors($validator)->withInput();
        }

        $formData = $request->all();

        $user = User::where(['email' => $formData['email'],'id' => 1])->first();

        if(!empty($user)){

            $credentials = [
                'email'     => $formData['email'],
                'password'  => $formData['password'],
                'is_active' => 1,
                'is_delete' => 0
            ];

            $authSuccess = Auth::guard('admin')->attempt($credentials,true);
            
            if($authSuccess){

                $message = "Welcome back ".ucfirst($user->name);

                $request->session()->flash('success',$message);

                return redirect('admin/dashboard');

            }else{
                $message = "Credentials does not match our records";
                $request->session()->flash('error',$message);
                return redirect('admin/login');
            }
        }else{
            $message = "User does not exist!!";
            $request->session()->flash('error',$message);
            return redirect('admin/login');
        }
    }
    
    protected function guard()
    {
        return Auth::guard('admin');
    }
   
}
