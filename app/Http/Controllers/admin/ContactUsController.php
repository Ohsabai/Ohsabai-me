<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\ContactUs;
use DB;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;

class ContactUsController extends Controller
{
    public function index(){
    	return view('admin.contact_us.list');
    }

    public function getList(){
    	$contact = ContactUs::where("is_delete",0)->orderBy('id','desc')->get();

        return Datatables::of($contact)

        ->addColumn('action',function($contact){
            $delete  = '<a href="javascript:;" data-id = "'.$contact->id.'" class="btn red-sunglo btn-sm delete btn_shadow"><i class="fa fa-trash"></i></a>';

            $view = '<a class="btn blue view btn-sm" href="'.route('admin.contact.view',$contact->id).'"><i class="fa fa-eye"></i></a>';

            $actions    = $delete . $view;
            return $actions;
        })
        ->rawColumns(['action'])
        ->make(true);
    }

    public function delete(Request $request){
		
		$id = $request->id;

		$user = ContactUs::findOrFail($id);

		$result = ContactUs::where('id','=',$id)->update(['is_delete'=>1]);

		if($result == 1){
			$json['status'] = 'success';
            $json['message'] = 'Deleted successfully!';
            $json['redirect'] = url('admin/list-contact'); 
		}else{
			$json['status'] = 'error';
            $json['message'] = 'Something went wrong!';
		}
		echo json_encode($json);
		exit;
    }

    public function view($id){
        
        $data['contact'] = DB::table('contact_us')->where(["is_delete"=>0,'id'=>$id])->first();
        return view('admin.contact_us.view',$data);
    }
}
