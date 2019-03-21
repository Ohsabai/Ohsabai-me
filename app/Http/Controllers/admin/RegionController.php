<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use DB;
use App\Region;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;

class RegionController extends Controller
{
    public function index(){
    	return view('admin.region.list');
    }

    public function getList(){
    	$region = Region::where("is_delete",0)->orderBy('id','desc')->get(); 

        return Datatables::of($region)
        ->addColumn('status',function($region){
        	if($region->is_active == 1){
               $status = '<input type="checkbox" data-value="0" name="status[]" data-id="'.$region->id.'"  checked class="make-switch status" id="status_'.$region->id.'" data-size="small">';
            }else{
                 $status = '<input type="checkbox" data-value="1" name="status[]" data-id="'.$region->id.'"  class="make-switch status" id="status_'.$region->id.'" data-size="small">';
            }
            return $status;
        })
        ->addColumn('action',function($region){
            $edit = '<a href="'.url("admin/edit-region/".encrypt_decrypt_fn('encrypt',$region->id)).'" class="btn green-meadow btn-sm"><i class="fa fa-pencil"></i></a>';

            $delete  = '<a href="javascript:;" data-id = "'.$region->id.'" class="btn red-sunglo btn-sm delete btn_shadow"><i class="fa fa-trash"></i></a>';

            $actions    = $edit." ".$delete;
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
    	return view('admin.region.create');	
    }

    public function store(Request $request){

     if ($request->isMethod('post')) {

	    	$request->validate([
	            'city_name' => 'required|string'
            ]);

	        $formData = $request->all();

	        $region = Region::where(['city_name'=>$request->city_name,"is_delete"=>0])->first();

	        if(empty($region)){

	        	$data = Region::create([
		        	'city_name' => $request->city_name,
		            'is_active' => 1
	        	]);

		        if($data){
		            $json['status'] = 'success';
		            $json['message'] = 'Saved successfully !';
		            $json['redirect'] = url('admin/list-region');    
		        }else{
		            $json['status'] = 'error';
		            $json['message'] = 'Something went wrong !!';

		        }
	        }else{
	        	$json['status'] = 'warning';
		        $json['message'] = 'Region already exist !!';
                //$json['reload'] = true;
	        }
            echo json_encode($json);
		    exit;
        }	
    }

    public function change_status(Request $request){
		
		$id = $request->id;
		$status = $request->status;

		Region::where('id','=',$id)->update(['is_active'=>$status]);

		if($status == 1){
			$json['status'] = 'success';
            $json['message'] = 'Activate successfully !';
		}else{
			$json['status'] = 'success';
            $json['message'] = 'Inactive successfully !';
		}
		$json['redirect'] = url('admin/list-region'); 
		echo json_encode($json);
		exit;


    }

    public function delete(Request $request){
		
		$id = $request->id;

		$region = Region::findOrFail($id);

		$result = Region::where('id','=',$id)->update(['is_delete'=>1]);

		if($result == 1){
			$json['status'] = 'success';
            $json['message'] = 'Deleted successfully!';
            $json['redirect'] = url('admin/list-region'); 
		}else{
			$json['status'] = 'error';
            $json['message'] = 'Something went wrong!';

		}
		echo json_encode($json);
		exit;
    }

    public function edit($id){
    	
        $id = encrypt_decrypt_fn('decrypt',$id);
    	$data['region'] = Region::findOrFail($id);

	    return view('admin.region.edit',$data);	
    }

    public function edit_store(Request $request){
     if ($request->isMethod('post')) {

    	$request->validate([
            'city_name' => 'required|string',
        ]);

    	$data = array(
        	'city_name' => $request->city_name,
    	);

        $id_array = array($request->id);
        $region = Region::where(['city_name'=>$request->city_name,"is_delete"=>0])
                  ->whereNotIn('id',$id_array)  
                  ->first();

        if(empty($region)){

            $region = Region::where('id',$request->id)->update($data);

            if($region){
                $json['status'] = 'success';
                $json['message'] = 'Updated successfully !';
                $json['redirect'] = url('admin/list-region');    
            }else{
                $json['status'] = 'error';
                $json['message'] = 'Something went wrong !!';
            }
           
            if($data){
                $json['status'] = 'success';
                $json['message'] = 'Update successfully !';
                $json['redirect'] = url('admin/list-region');    
            }else{

                $json['status'] = 'error';
                $json['message'] = 'Something went wrong !!';
                $json['reload'] = true;
            }
        }else{
            $json['status'] = 'warning';
            $json['message'] = 'Region already exist !!';
            //$json['reload'] = true;
        }
        echo json_encode($json);
        exit;
    }	
  }

  public function check_duplicate_name(Request $request){
        $name = $request->name;

        $where['city_name'] = $name;
        $where['is_delete'] = 0;

        if(!empty($request->id)){
            $count = DB::table('region')->where($where)->whereNotIn('id',[$request->id])->count();
        }
        else {
            $count = DB::table('region')->where($where)->count();
        }

        
        if($count > 0){
            echo "City name is already exist.";
        }
        else {
            echo "false";
        }
        exit;
  }
}
