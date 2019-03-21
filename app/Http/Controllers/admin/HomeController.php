<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Auth;
use App\User;
use Hash;
use DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Support\Facades\Validator;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:admin');
    }
/**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $data['therapist'] = DB::table('model_has_roles')->where('role_id','2')->get()->count();
        $data['user'] = DB::table('model_has_roles')->where('role_id','3')->get()->count();
        $data['treatment'] = DB::table('treatments')->where('is_delete','0')->get()->count();
        $data['contact_us'] = DB::table('contact_us')->get()->count();
        return view('admin.home',$data);
    }

    public function profile()
    {
        $id = Auth::guard('admin')->user()->id;
        $data['user'] = User::where('id',$id)->first();
        return view('admin.profile',$data);
    }

    public function update_profile(Request $request)
    {
        $request->validate([
            'name' => 'required|string|min:3',
            'email' => 'required',
            'mobile' => 'required'
        ]);

        $formData = $request->all();

        $data = array(
            'name' =>$formData['name'],
            'email' =>$formData['email'],
            'mobile_no' =>$formData['mobile']
        );
        
        $id = Auth::guard('admin')->user()->id;
        
        $result = User::where('id',$id)->update($data);

        if($result){
            $json['status'] = 'success';
            $json['message'] = 'Profile updated successfully !';
            $json['redirect'] = url('admin/profile');    
        }else{
            $json['status'] = 'error';
            $json['message'] = 'Something went wrong !!';
        }
        echo json_encode($json);
        exit;
    }


    public function change_password(Request $request)
    {
        $request->validate([
            'old_password' => 'required|string|min:3',
            'new_password' => 'required',
            'cpassword' => 'required'
        ]);

        $formData = $request->all();

        $data = array(
            'password' =>bcrypt($formData['new_password']),
        );
        
        $user = Auth::guard('admin')->user();
        if(Hash::check($formData['old_password'],$user->password)) {
            $result = User::where('id',$user->id)->update($data);    
            
            if($result){
                $json['status'] = 'success';
                $json['message'] = 'Password changed successfully !';
                $json['redirect'] = url('admin/profile');    
            }else{
                $json['status'] = 'error';
                $json['message'] = 'Something went wrong !';
            }

        }else{
            $json['status'] = 'error';
            $json['message'] = 'Current password doesn\'t match !!';
        }
        
        echo json_encode($json);
        exit;
    }

    public function change_profile_image(Request $request)
    {

        $user = Auth::guard('admin')->user();

        $customImageName = NULL;

        if ($file = $request->hasFile('image')) {
            $file            = $request->file('image');
            $customImageName  = time() . '.' . $file->getClientOriginalExtension();
            $destinationPath = public_path() . '/uploads/user/';
            $file->move($destinationPath, $customImageName);
            if (!empty($user->image) && file_exists(public_path() . '/uploads/user/'.$user->image)) {
                unlink(public_path() . '/uploads/user/'.$user->image);
            }
        }

        if(!empty($customImageName)){
            $result = User::where("id",$user->id)->update(['image'=>$customImageName]);    
        }else{
            $result = 1;
        }
        
        if($result){
            $json['status'] = 'success';
            $json['message'] = 'Updated successfully !';
            $json['redirect'] = url('admin/profile');    
        }else{
            $json['status'] = 'error';
            $json['message'] = 'Something went wrong !';
        }
        echo json_encode($json);
        exit;
    }


    public function logout(){

        Auth::logout();

        session()->invalidate();

        return redirect('/admin/login');
    }
}