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
use App\Region;

class TherapistController extends Controller
{
    public function index(){
    	return view('admin.therapist.list');
    }

    public function getList(){
    	$users = DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
    	->where(['users.is_delete'=>'0','model_has_roles.role_id'=>2])->orderBy('id','desc')->get();

        return Datatables::of($users)
        ->addColumn('status',function($users){
        	
            if($users->is_active == 1){

               $status = '<input type="checkbox" data-on-text="vcxvcx" data-value="0" name="status[]" data-id="'.$users->id.'"  checked class="make-switch status" id="status_'.$users->id.'" data-size="small">';
            }else{
                 $status = '<input type="checkbox" data-off-text="sdsdssddhsjd" data-value="1" name="status[]" data-id="'.$users->id.'"  class="make-switch status" id="status_'.$users->id.'" data-size="small">';
            }
            return $status;
        })
        ->addColumn('action',function($users){
            $edit = '<a href="'.url("admin/edit-therapist/".encrypt_decrypt_fn('encrypt',$users->id)).'" class="btn green-meadow btn-sm"><i class="fa fa-pencil"></i></a>';

            $delete  = '<a href="javascript:;" data-id = "'.$users->id.'" class="btn red-sunglo btn-sm delete btn_shadow"><i class="fa fa-trash"></i></a>';

            $view = '<a class="btn blue view btn-sm" href="'.route("admin.therapist.view",encrypt_decrypt_fn('encrypt',$users->id)).'"><i class="fa fa-eye"></i></a>';

            $actions    = $edit." ".$delete ." ". $view;
            return $actions;
        })

        ->addColumn('created_at',function($users){
            $created_at    = date("d-m-Y",strtotime($users->created_at));
            return $created_at;
        })
        ->rawColumns(['status','action','created_at'])
        ->make(true);
    }

    public function create(){
        $data['region'] = Region::where(['is_active'=>1,'is_delete' =>0])->get();
    	return view('admin.therapist.create',$data);	
    }

    public function store(Request $request){

     if ($request->isMethod('post')) {

	    	
	        $formData = $request->all();

            $rules = array(
                'email'      => 'required|unique:users,email',
                'name'     => 'required',
                'mobile'    => 'required',
                'address'   => 'required',
                'lat'       => 'required',
                'long'      => 'required',
                'distance'  => 'required',
                'password'  => 'required',
                'cpassword' => 'required',
                'city'      => 'required',
                'distance'  => 'required',
                'year'      => 'required',
                //'image'     => 'mimes:jpg,png'
            );    

            $validator = Validator::make($formData, $rules);

            if ($validator->fails()){
                $json['status'] = 'error';
                $json['message'] = $validator->errors();
                $json['status'] = 'validator_error';
                echo json_encode($json);
                exit;
            }
     
            $token = md5(rand(00000,99999));

            $image = $request->file('image');
            if($image!=''){

                $imageName = time().'.'.$image->getClientOriginalExtension();
                if(!file_exists($imageName)){
                    $destinationPath = public_path('uploads/user');
                    $image->move($destinationPath, $imageName);
                }
            }else{
                $imageName = '';
            }

           

            $cusers = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'mobile_no' => $request->mobile,
                'address' => $request->address,
                'lat' => $request->lat,
                'lng' => $request->long,
                'distance' => $request->distance,
                'password' => bcrypt($request->password),
                'provide_treatment' => $request->provide,
                'transport_mode' => $request->transport,
                'year' => $request->year,
                'gender' => $request->gender,
                'region_id' => $request->city,
                'working_area' => json_encode($request->workig_area),
                'image' => $imageName,
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
	        
            echo json_encode($json);
		    exit;
        }	
    }

    public function change_status(Request $request){
		
		$id = $request->id;
		$status = $request->status;

		User::where('id','=',$id)->update(['is_active'=>$status]);

		if($status == 1){
			$json['status'] = 'success';
            $json['message'] = 'Activate successfully !';
		}else{
			$json['status'] = 'success';
            $json['message'] = 'Inactive successfully !';
		}
		$json['redirect'] = url('admin/list-therapist'); 
		echo json_encode($json);
		exit;


    }

    public function delete(Request $request){
		
		$id = $request->id;

		$user = User::findOrFail($id);

		$user->roles()->detach();

		$result = User::where('id','=',$id)->update(['is_delete'=>1]);

		if($result == 1){
			$json['status'] = 'success';
            $json['message'] = 'Deleted successfully!';
            $json['redirect'] = url('admin/list-therapist'); 
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
        $data['region'] = Region::where(['is_active'=>1,'is_delete' =>0])->get();

    	if($id == 1){
    		session()->flash('error', 'User does not exist !!');
    		return redirect("admin/list-therapist");
    	}
	    return view('admin.therapist.edit',$data);	
    }

    public function view($id){
        
        $id = encrypt_decrypt_fn('decrypt',$id);
        $data['user'] = User::findOrFail($id);
        $data['city'] = Region::findOrFail($data['user']->region_id);
        return view('admin.therapist.view',$data);                
    }

    public function edit_store(Request $request){

     if ($request->isMethod('post')) {

    	$formData = $request->all();

        $rules = array(
            'email'      => 'required|unique:users,email,'.$formData['id'],
            'name'     => 'required',
            'mobile'    => 'required',
            'address'   => 'required',
            'lat'       => 'required',
            'long'      => 'required',
            'distance'  => 'required',
            'city'      => 'required',
            'distance'  => 'required',
            'year'      => 'required',
            //'image'     => 'mimes:jpg,png'
        );    

        $validator = Validator::make($formData, $rules);

        if ($validator->fails()){
            $json['status'] = 'error';
            $json['message'] = $validator->errors();
            $json['status'] = 'validator_error';
            echo json_encode($json);
            exit;
        }

        $image = $request->file('image');
        if($image!=''){

            if($request->hid_image != ""){
                if ($request->image!='' && file_exists(public_path() . '/uploads/user/'.$request->hid_image)) {
                    unlink(public_path() . '/uploads/user/'.$request->hid_image);
                }    
            }
            
            $imageName = time().'.'.$image->getClientOriginalExtension();
            if(!file_exists($imageName)){

                $destinationPath = public_path('uploads/user');
                $image->move($destinationPath, $imageName);
            }
        }else{
            $imageName = $request->hid_image;
        }

    	$cusers = array(
        	'name' => $request->name,
            'email' => $request->email,
            'mobile_no' => $request->mobile,
            'address' => $request->address,
            'lat' => $request->lat,
            'lng' => $request->long,
            'distance' => $request->distance,
            'region_id' => $request->city,
            'working_area' => json_encode($request->workig_area),
            'provide_treatment' => $request->provide,
            'transport_mode' => $request->transport,
            'year' => $request->year,
            'gender' => $request->gender,
            'image' => $imageName,
            'region_id' => $request->city,
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
}
