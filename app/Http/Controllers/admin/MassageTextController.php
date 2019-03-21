<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use DB;
use App\MassageText;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;
use Response;

class MassageTextController extends Controller
{
  public function index(){

        $data['massage_text'] = MassageText::where("id",1)->first();
        return view('admin.massage_text.index',$data);
    }

    public function store(Request $request){

        if ($request->isMethod('post')) {

            if(empty($request->id)){
                $data = MassageText::create([
                    'text_1' => $request->text_1,
                    'text_2' => $request->text_2,
                    'text_3' => $request->text_3,
                    'text_4' => $request->text_4,
                    'text_5' => $request->text_5,
                    'text_6' => $request->text_6,
                    'text_7' => $request->text_7,
                    'text_8' => $request->text_8,
                    'text_9' => $request->text_9,
                ]);
            }
            else {
                 $data = MassageText::where('id',$request->id)->update([
                    'text_1' => $request->text_1,
                    'text_2' => $request->text_2,
                    'text_3' => $request->text_3,
                    'text_4' => $request->text_4,
                    'text_5' => $request->text_5,
                    'text_6' => $request->text_6,
                    'text_7' => $request->text_7,
                    'text_8' => $request->text_8,
                    'text_9' => $request->text_9,
                ]);
            }
         
      }          

     if($data){
           $json['status'] = 'success';
           $json['message'] = 'Updated successfully !';
           $json['reload'] = 'true';    
     }else{
           $json['status'] = 'error';
           $json['message'] = 'Something went wrong !!';
     }

     echo json_encode($json);
     exit;
   }
}
