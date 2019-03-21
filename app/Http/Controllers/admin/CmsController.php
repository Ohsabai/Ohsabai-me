<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use DB;
use App\Cms;
use App\Category;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;

class CmsController extends Controller
{
    public function index(){
    	return view('admin.cms.list');
    }

    public function getList(){
    	$cms = Cms::where("is_delete",0)->orderBy('id','desc')->get(); 

        return Datatables::of($cms)

        // ->addColumn('image',function($cms){
        //     if (!empty($cms->image) && file_exists(public_path() . '/uploads/cms/'.$cms->image)) {
        //         $image = '<img src="'.url("public/uploads/cms/".$cms->image).'" alt="CMS Image" width="60" height="60">';
        //     }else{
        //         $image = '<img src="'.url("public/uploads/no_image.jpg").'" alt="No Image" width="60" height="60">';
        //     }
        //     return $image;
        // })

        ->addColumn('status',function($cms){
            if($cms->is_active == 1){
               $status = '<input type="checkbox" data-value="0" name="status[]" data-id="'.$cms->id.'"  checked class="make-switch status" id="status_'.$cms->id.'" data-size="small">';
            }else{
                 $status = '<input type="checkbox" data-value="1" name="status[]" data-id="'.$cms->id.'"  class="make-switch status" id="status_'.$cms->id.'" data-size="small">';
            }
            return $status;
        })
        ->addColumn('action',function($cms){
            $edit = '<a href="'.url("admin/edit-cms/".$cms->id).'" class="btn green-meadow btn-sm"><i class="fa fa-pencil"></i></a>';

            $delete  = '<a href="javascript:;" data-id = "'.$cms->id.'" class="btn red-sunglo btn-sm delete btn_shadow"><i class="fa fa-trash"></i></a>';

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
    	return view('admin.cms.create');	
    }

    public function store(Request $request){

     if ($request->isMethod('post')) {

            $formData = $request->all();
            $rules = array(
                'page_name' => 'required',
                'page_name'      => 'required|unique:cms_page,page_name',
                'page_slug'      => 'required|unique:cms_page,page_slug',
                'content' => 'required',
            );    

            $validator = Validator::make($formData, $rules);

            if ($validator->fails()){
                $json['status'] = 'error';
                $json['message'] = $validator->errors();
                $json['status'] = 'validator_error';
                echo json_encode($json);
                exit;
            }
            
            $customImageName ="";

            if ($file = $request->hasFile('image')) {
                $file            = $request->file('image');
                $customImageName  = time() . '.' . $file->getClientOriginalExtension();
                $destinationPath = public_path() . '/uploads/cms/';
                $file->move($destinationPath, $customImageName);
            }

        	$data = Cms::create([
                'page_name' => $request->page_name,
                'page_slug' => $request->page_slug,
	        	'short_description' => $request->short_description,
                'content' => mysql_real_escape_string($request->content),
                'image' => $customImageName,
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
	            'is_active' => 1,
        	]);

            $last_id = DB::getPdo()->lastInsertId();
            
            if(!empty($customImageName)){
                $data_image = Cms::where("id",$last_id)->update([
                    'image' => $customImageName,
                ]);
            }

	        if($data){
	            $json['status'] = 'success';
	            $json['message'] = 'Saved successfully !';
	            $json['redirect'] = url('admin/list-cms');    
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

		Cms::where('id','=',$id)->update(['is_active'=>$status]);

		if($status == 1){
			$json['status'] = 'success';
            $json['message'] = 'Activate successfully !';
		}else{
			$json['status'] = 'success';
            $json['message'] = 'Inactive successfully !';
		}
		$json['redirect'] = url('admin/list-cms'); 
		echo json_encode($json);
		exit;


    }

    public function delete(Request $request){
		
		$id = $request->id;

		$cms = Cms::findOrFail($id);

		$result = Cms::where('id','=',$id)->update(['is_delete'=>1]);

        if (isset($cms->image) && file_exists(storage_path() . '/app/cms_images/'.$cms->image)) {
            unlink(storage_path() . '/app/cms_images/'.$cms->image);
        }

		if($result == 1){
			$json['status'] = 'success';
            $json['message'] = 'Deleted successfully!';
            $json['redirect'] = url('admin/list-cms'); 
		}else{
			$json['status'] = 'error';
            $json['message'] = 'Something went wrong!';
		}
		echo json_encode($json);
		exit;
    }

    public function edit($id){
    	
    	$data['cms'] = Cms::findOrFail($id);

	    return view('admin.cms.edit',$data);
    }

    public function edit_store(Request $request){

     if ($request->isMethod('post')) {

            $request->validate([
                'page_name' => 'required',
                'content' => 'required',
            ]);

            $customImageName ="";
            
            $cms = Cms::findOrFail($request->id);
            if ($file = $request->hasFile('image')) {

                $file            = $request->file('image');
                $customImageName  = time() . '.' . $file->getClientOriginalExtension();
                $destinationPath = public_path() . '/uploads/cms/';
                $file->move($destinationPath, $customImageName);
                if (!empty($cms->image) && file_exists(public_path() . '/uploads/cms/'.$cms->image)) {
                    unlink(public_path() . '/uploads/cms/'.$cms->image);
                }
            }

            $data = Cms::where("id",$cms->id)->update([
                'page_name' => $request->page_name,
                'short_description' => $request->short_description,
                'content' => $request->content,
                'meta_title' => $request->meta_title,
                'meta_description' => $request->meta_description,
            ]);

            if(!empty($customImageName)){
               Cms::where("id",$cms->id)->update([
                    'image' =>$customImageName
               ]);    
            }

            if($data){
                $json['status'] = 'success';
                $json['message'] = 'Saved successfully !';
                $json['redirect'] = url('admin/list-cms');    
            }else{
                $json['status'] = 'error';
                $json['message'] = 'Something went wrong !!';
            }

            echo json_encode($json);
            exit;
        }
  }
}
