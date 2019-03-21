<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use DB;
use App\Pricing;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;

class PricingController extends Controller
{
    public function index(){
        return view('admin.pricing.list');
    }

    public function getList(){
        $pricing = Pricing::where("is_delete",0)->orderBy('id','desc')->get();
        
        return Datatables::of($pricing)
        ->addColumn('time',function($pricing){
            
            $time = $pricing->time ." Hour";

		   if (strstr($pricing->time, ':')) {
				$separatedData = explode(':',$pricing->time);
				$minutesInHours    = $separatedData[0] * 60;
				$minutesInDecimals = $separatedData[1];
				$totalMinutes = $minutesInHours + $minutesInDecimals;
			}

			/*if($totalMinutes > 90){
				$time = $pricing->time ." Hour";
			}
			else {*/
				$time = $totalMinutes ." Minute";
			/*}*/

            return $time;
        })
        ->addColumn('price',function($pricing){

            $price = html_entity_decode(get_currency()) . $pricing->price;
			return $price;
        })
        ->addColumn('status',function($pricing){
            if($pricing->is_active == 1){
               $status = '<input type="checkbox" data-value="0" name="status[]" data-id="'.$pricing->id.'"  checked class="make-switch status" id="status_'.$pricing->id.'" data-size="small">';
            }else{
                 $status = '<input type="checkbox" data-value="1" name="status[]" data-id="'.$pricing->id.'"  class="make-switch status" id="status_'.$pricing->id.'" data-size="small">';
            }
            return $status;
        })
        ->addColumn('action',function($pricing){
            $edit = '<a href="'.url("admin/edit-pricing/".$pricing->id).'" class="btn green-meadow btn-sm"><i class="fa fa-pencil"></i></a>';

            $delete  = '<a href="javascript:;" data-id = "'.$pricing->id.'" class="btn red-sunglo btn-sm delete btn_shadow"><i class="fa fa-trash"></i></a>';

            $actions    = $edit." ".$delete;
            return $actions;
        })
        ->addColumn('created_at',function($users){
            $created_at    = date("d-m-Y",strtotime($users->created_at));
            return $created_at;
        })
        ->rawColumns(['time','price','status','action','created_at'])
        ->make(true);
    }

    public function create(){
        return view('admin.pricing.create'); 
    }

    public function store(Request $request){

     if ($request->isMethod('post')) {

            $request->validate([
                'time' => 'required',
                'price' => 'required',
            ]);

            $formData = $request->all();

            $pricing = Pricing::where(['time'=>$request->time.":00",'price'=>$request->price,"is_delete"=>0])->first();

            if(empty($pricing)){

                if($request->time == "0:00"){
                    $json['status'] = 'warning';
                    $json['message'] = 'Please select time!';
                    echo json_encode($json);
                    exit;
                }

                $data = Pricing::create([
                    'time' => $request->time.":00",
                    'price' => $request->price,
                    'is_active' => 1
                ]);

                if($data){
                    $json['status'] = 'success';
                    $json['message'] = 'Saved successfully !';
                    $json['redirect'] = url('admin/list-pricing');    
                }else{
                    $json['status'] = 'error';
                    $json['message'] = 'Something went wrong !!';
                }
            }else{
                $json['status'] = 'warning';
                $json['message'] = 'Price already exist !!';
            }

            echo json_encode($json);
            exit;
        }   
    }

    public function change_status(Request $request){
        
        $id = $request->id;
        $status = $request->status;

        Pricing::where('id','=',$id)->update(['is_active'=>$status]);

        if($status == 1){
            $json['status'] = 'success';
            $json['message'] = 'Activate successfully !';
        }else{
            $json['status'] = 'success';
            $json['message'] = 'Inactive successfully !';
        }
        $json['redirect'] = url('admin/list-pricing'); 
        echo json_encode($json);
        exit;


    }

    public function delete(Request $request){
        
        $id = $request->id;

        $pricing = Pricing::findOrFail($id);

        $result = Pricing::where('id','=',$id)->update(['is_delete'=>1]);

        if($result == 1){
            $json['status'] = 'success';
            $json['message'] = 'Deleted successfully!';
            $json['redirect'] = url('admin/list-pricing'); 
        }else{
            $json['status'] = 'error';
            $json['message'] = 'Something went wrong!';
        }
        echo json_encode($json);
        exit;
    }

    public function edit($id){
        
        $data['pricing'] = Pricing::findOrFail($id);

        return view('admin.pricing.edit',$data); 
    }

    public function edit_store(Request $request){

     if ($request->isMethod('post')) {

        $request->validate([
            'time' => 'required',
            'price' => 'required',
        ]);

        if($request->time == "0:00"){
            $json['status'] = 'warning';
            $json['message'] = 'Please select time!';
            echo json_encode($json);
            exit;
        }

        $data = array(
            'time' => $request->time.":00",
            'price' => $request->price,
        );

        $pricing = Pricing::where('id',$request->id)->update($data);

        if($pricing){
            $json['status'] = 'success';
            $json['message'] = 'Updated successfully !';
            $json['redirect'] = url('admin/list-pricing');    
        }else{
            $json['status'] = 'error';
            $json['message'] = 'Something went wrong !!';
        }
        echo json_encode($json);
        exit;
    }   
  }
}
