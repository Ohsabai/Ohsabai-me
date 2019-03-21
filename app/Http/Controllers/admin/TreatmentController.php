<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use DB;
use App\Treatment;
use App\Category;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;
use Response;

class TreatmentController extends Controller
{
    public function index(){
    	return view('admin.treatment.list');
    }

    public function getList(){
    	$treatment = Treatment::where("is_delete",0)->orderBy('id','desc')->get(); 

        return Datatables::of($treatment)

        ->addColumn('image',function($treatment){
            if (!empty($treatment->image) && file_exists(public_path() . '/uploads/massage/'.$treatment->image)) {
                $image = '<img src="'.url("public/uploads/massage/".$treatment->image).'" alt="Massage Image" width="60" height="60">';
            }else{

                $image = '<img src="'.url("public/uploads/no_image.jpg").'" alt="No Image" width="60" height="60">';
            }
            return $image;
        })


       
        ->addColumn('status',function($treatment){
            if($treatment->is_active == 1){
               $status = '<input type="checkbox" data-value="0" name="status[]" data-id="'.$treatment->id.'"  checked class="make-switch status" id="status_'.$treatment->id.'" data-size="small">';
            }else{
                 $status = '<input type="checkbox" data-value="1" name="status[]" data-id="'.$treatment->id.'"  class="make-switch status" id="status_'.$treatment->id.'" data-size="small">';
            }
            return $status;
        })
        ->addColumn('action',function($treatment){
            $edit = '<a href="'.url("admin/edit-treatment/".encrypt_decrypt_fn('encrypt',$treatment->id)).'" class="btn green-meadow btn-sm"><i class="fa fa-pencil"></i></a>';

            $delete  = '<a href="javascript:;" data-id = "'.$treatment->id.'" class="btn red-sunglo btn-sm delete btn_shadow"><i class="fa fa-trash"></i></a>';

            $actions    = $edit." ".$delete;
            return $actions;
        })

        ->addColumn('price_time',function($treatment){
            $price_array = get_time_price_by_tretment_id($treatment->id);

            $price_string = ""; 
            if(!empty($price_array)){
                foreach ($price_array as $value) {
                    $price_string = $price_string . $value->price .'-' .$value->time . "<br>";
                }    
            }
            return $price_string;
        })

        ->addColumn('created_at',function($users){
            $created_at    = date("d-m-Y",strtotime($users->created_at));
            return $created_at;
        })

        ->rawColumns(['image','price_time','status','action','created_at'])
        ->make(true);
    }

    public function create(){
        $data['category'] = Category::where(['is_delete'=>0])->get();
    	return view('admin.treatment.create',$data);	
    }

    public function store(Request $request){

     if ($request->isMethod('post')) {

            $formDate = $request->all();

            $rules = array(
                'treatment_name' => 'required|string|unique:treatments,treatment_name',
                'image' => 'required',
                'overview' => 'required',
                'treatment' => 'required',
                'faq' => 'required',
            );    

            $validator = Validator::make($formDate, $rules);

            if ($validator->fails()){

                $json['status'] = 'error';
                $json['message'] = $validator->errors();
                $json['status'] = 'validator_error';
                echo json_encode($json);
                exit;
            }

            if ($file = $request->hasFile('image')) {
                $file            = $request->file('image');
                $customImageName  = time() . '.' . $file->getClientOriginalExtension();
                $destinationPath = public_path() . '/uploads/massage/';
                $file->move($destinationPath, $customImageName);
            }

        	$data = Treatment::create([
                'category_id' => isset($request->category_id)?($request->category_id):0,
	        	'treatment_name' => $request->treatment_name,
                'overview' => $request->overview,
                'treatment' => $request->treatment,
                'faq' => $request->faq,
	            'is_active' => 1,
                'created_by' => Auth::guard("admin")->user()->id,
                'image' =>$customImageName
        	]);


            $tretment_id = DB::getPdo()->lastInsertId();

            $count = $request->hid_count;
            for ($i=0; $i <= $count ; $i++) { 
                if(!empty($request->price[$i]) && !empty($request->time[$i])){
                    DB::table('price_time')->insert(
                        [
                         'treatments_id' => $tretment_id,    
                         'price' => $request->price[$i], 
                         'time' => $request->time[$i]
                        ]
                    );        
                }
            }

	        if($data){
	            $json['status'] = 'success';
	            $json['message'] = 'Saved successfully !';
	            $json['redirect'] = url('admin/list-treatment');    
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

		Treatment::where('id','=',$id)->update(['is_active'=>$status]);

		if($status == 1){
			$json['status'] = 'success';
            $json['message'] = 'Activate successfully !';
		}else{
			$json['status'] = 'success';
            $json['message'] = 'Inactive successfully !';
		}
		$json['redirect'] = url('admin/list-treatment'); 
		echo json_encode($json);
		exit;


    }

    public function delete(Request $request){
		
		$id = $request->id;

		$treatment = Treatment::findOrFail($id);

		$result = Treatment::where('id','=',$id)->update(['is_delete'=>1]);

        if (isset($treatment->image) && file_exists(storage_path() . '/app/treatment_images/'.$treatment->image)) {
            unlink(storage_path() . '/app/treatment_images/'.$treatment->image);
        }

		if($result == 1){
			$json['status'] = 'success';
            $json['message'] = 'Deleted successfully!';
            $json['redirect'] = url('admin/list-treatment'); 
		}else{
			$json['status'] = 'error';
            $json['message'] = 'Something went wrong!';
		}
		echo json_encode($json);
		exit;
    }

    public function edit($id){

        $id = encrypt_decrypt_fn('decrypt',$id);
        $data['category'] = Category::where(['is_delete'=>0])->get();
        $data['price_time'] = DB::table('price_time')->where(['treatments_id'=>$id])->orderBy('created_at')->get();
        $data['price_time_count'] = DB::table('price_time')->where(['treatments_id'=>$id])->count();
        $data['treatment'] = Treatment::findOrFail($id);


	    return view('admin.treatment.edit',$data);
    }

    public function edit_store(Request $request){

     if ($request->isMethod('post')) {

            $formDate = $request->all();

            $rules = array(
                'treatment_name' => 'required|string|unique:treatments,treatment_name,'.$formDate['id'],
                'overview' => 'required',
                'treatment' => 'required',
                'faq' => 'required',
            );    

            $validator = Validator::make($formDate, $rules);

            if ($validator->fails()){

                $json['status'] = 'error';
                $json['message'] = $validator->errors();
                $json['status'] = 'validator_error';
                echo json_encode($json);
                exit;
            }

            $customImageName ="";
            $treatment = Treatment::findOrFail($request->id);
            if ($file = $request->hasFile('image')) {
                $file            = $request->file('image');
                $customImageName  = time() . '.' . $file->getClientOriginalExtension();
                $destinationPath = public_path() . '/uploads/massage/';
                $file->move($destinationPath, $customImageName);
                if (!empty($treatment->image) && file_exists(public_path() . '/uploads/massage/'.$treatment->image)) {
                    unlink(public_path() . '/uploads/massage/'.$treatment->image);
                }
            }

            $data = Treatment::where("id",$treatment->id)->update([
                /*'category_id' => isset($request->category_id)?($request->category_id):0,*/
                'treatment_name' => $request->treatment_name,
                'overview' => $request->overview,
                'treatment' => $request->treatment,
                'faq' => $request->faq,
                'is_active' => 1
            ]);



            if(!empty($customImageName)){
               Treatment::where("id",$treatment->id)->update([
                    'image' =>$customImageName
               ]);    
            }

            DB::table('price_time')->where('treatments_id', $treatment->id)->delete();

            $count = $request->hid_count;
            for ($i=0; $i <= $count ; $i++) { 
                if(!empty($request->price[$i]) && !empty($request->time[$i])){
                    DB::table('price_time')->insert(
                        [
                         'treatments_id' => $treatment->id,    
                         'price' => $request->price[$i], 
                         'time' => $request->time[$i]
                        ]
                    );        
                }
            }

            if($data){
                $json['status'] = 'success';
                $json['message'] = 'Saved successfully !';
                $json['redirect'] = url('admin/list-treatment');    
            }else{
                $json['status'] = 'error';
                $json['message'] = 'Something went wrong !!';
            }

            echo json_encode($json);
            exit;
        }
  }

  public function addrow(Request $request){ 
    ?>
        <div class='div_<?php echo $request->count; ?>'>
         <div class='form-group'>
            <label class="control-label col-md-3"></label>
            <div class="col-md-2">
                <input type="text" class="form-control numeric" placeholder="Price" name="price[]" maxlength="10"/>
            </div>
            <div class="col-md-2">
                <input type="text" class="form-control numeric" placeholder="Time in minutes"name="time[]"  maxlength="4"/>
            </div>
            
            <div class="col-md-1">
                <i class="fa fa-plus plus"></i> &nbsp   
                <i class="fa fa-trash delete_row" onclick="delete_row('<?php echo $request->count; ?>')"></i>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(".numeric").on("keypress keyup blur",function (event) {    
           $(this).val($(this).val().replace(/[^\d].+/, ""));
            if ((event.which < 48 || event.which > 57)) {
                event.preventDefault();
           }
        });
    </script>
        <?php exit;
  }
}