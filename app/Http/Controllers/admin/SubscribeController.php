<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;
use App\Subscribe;

class SubscribeController extends Controller
{
    public function index(){
    	return view('admin.subscribe.list');
    }
    public function getList(){

    	$subscribe = Subscribe::where("is_delete",0)->orderBy('id','desc')->get(); 


        return Datatables::of($subscribe)

        ->addColumn('status',function($subscribe){
            if($subscribe->is_active == 1){
               $status = '<input type="checkbox" data-value="0" name="status[]" data-id="'.$subscribe->id.'"  checked class="make-switch status" id="status_'.$subscribe->id.'" data-size="small">';
            }else{
                 $status = '<input type="checkbox" data-value="1" name="status[]" data-id="'.$subscribe->id.'"  class="make-switch status" id="status_'.$subscribe->id.'" data-size="small">';
            }
            return $status;
        })
        ->rawColumns(['status'])
        ->make(true);
    }

    public function change_status(Request $request){
		
		$id = $request->id;
		$status = $request->status;

		Subscribe::where('id','=',$id)->update(['is_active'=>$status]);

		if($status == 1){
			$json['status'] = 'success';
            $json['message'] = 'Activate successfully !';
		}else{
			$json['status'] = 'success';
            $json['message'] = 'Inactive successfully !';
		}
		$json['redirect'] = url('admin/list-subscribe'); 
		echo json_encode($json);
		exit;


    }
}