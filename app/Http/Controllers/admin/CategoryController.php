    <?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use DB;
use App\Category;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;

class CategoryController extends Controller
{
    public function index(){
    	return view('admin.category.list');
    }

    public function getList(){
    	$category = Category::where("is_delete",0)->orderBy('id','desc')->get(); 

        return Datatables::of($category)

        ->addColumn('parent_id',function($category){
            if(isset($category->parent_id)){
                $parent_id = Category::getCategoryNameById($category->parent_id);
            }else{
                $parent_id = "-";
            }
        	return $parent_id;
        })

        ->addColumn('status',function($category){
            if($category->is_active == 1){
                $status = '<button type="button" class="btn green-meadow btn-xs status" data-id="'.$category->id.'" title="Active" data-value="0">Active</button>';
            }else{
                $status = '<button type="button" class="btn red-sunglo btn-xs status" data-id="'.$category->id.'" title="Inactive" data-value="1">Inactive</button>';
            }
            return $status;
        })
        ->addColumn('action',function($category){
            $edit = '<a href="'.url("admin/edit-category/".$category->id).'" class="btn green-meadow btn-sm"><i class="fa fa-pencil"></i></a>';

            $delete  = '<a href="javascript:;" data-id = "'.$category->id.'" class="btn red-sunglo btn-sm delete btn_shadow"><i class="fa fa-trash"></i></a>';

            $actions    = $edit." ".$delete;
            return $actions;
        })
        ->rawColumns(['parent_id','status','action'])
        ->make(true);
    }

    public function create(){
        $data['category'] = Category::where(['is_delete'=>0])->get();
    	return view('admin.category.create',$data);	
    }

    public function store(Request $request){

     if ($request->isMethod('post')) {

	    	$request->validate([
	            'category_name' => 'required|string',
	        ]);

	        $formData = $request->all();

	        $category = Category::where(['category_name'=>$request->category_name,"is_delete"=>0])->first();

	        if(empty($category)){

	        	$data = Category::create([
                    'parent_id' => isset($request->parent_id)?($request->parent_id):0,
		        	'category_name' => $request->category_name,
		            'is_active' => 1
	        	]);

		        if($data){
		            $json['status'] = 'success';
		            $json['message'] = 'Saved successfully !';
		            $json['redirect'] = url('admin/list-category');    
		        }else{
		            $json['status'] = 'error';
		            $json['message'] = 'Something went wrong !!';
		        }
	        }else{
	        	$json['status'] = 'warning';
		        $json['message'] = 'Category already exist !!';
	        }

	        echo json_encode($json);
		    exit;
        }	
    }

    public function change_status(Request $request){
		
		$id = $request->id;
		$status = $request->status;

		Category::where('id','=',$id)->update(['is_active'=>$status]);

		if($status == 1){
			$json['status'] = 'success';
            $json['message'] = 'Activate successfully !';
		}else{
			$json['status'] = 'success';
            $json['message'] = 'Inactive successfully !';
		}
		$json['redirect'] = url('admin/list-category'); 
		echo json_encode($json);
		exit;


    }

    public function delete(Request $request){
		
		$id = $request->id;

		$category = Category::findOrFail($id);

		$result = Category::where('id','=',$id)->update(['is_delete'=>1]);

		if($result == 1){
			$json['status'] = 'success';
            $json['message'] = 'Deleted successfully!';
            $json['redirect'] = url('admin/list-category'); 
		}else{
			$json['status'] = 'error';
            $json['message'] = 'Something went wrong!';
		}
		echo json_encode($json);
		exit;
    }

    public function edit($id){

        $data['category_list'] = Category::where(['is_delete'=>0])->get();
    	
    	$data['category'] = Category::findOrFail($id);

	    return view('admin.category.edit',$data);	
    }

    public function edit_store(Request $request){

     if ($request->isMethod('post')) {

    	$request->validate([
            'category_name' => 'required|string',
        ]);

    	$data = array(
            'parent_id' => isset($request->parent_id)?($request->parent_id):0,
        	'category_name' => $request->category_name,
    	);

        $id_array = array($request->id);
        $category = Category::where(['category_name'=>$request->category_name,"is_delete"=>0])
                    ->whereNotIn('id',$id_array)
                    ->first();

        if(empty($category)){

           $category = Category::where('id',$request->id)->update($data);

            if($category){
                $json['status'] = 'success';
                $json['message'] = 'Updated successfully !';
                $json['redirect'] = url('admin/list-category');    
            }else{
                $json['status'] = 'error';
                $json['message'] = 'Something went wrong !!';
            }
        }else{
            $json['status'] = 'warning';
            $json['message'] = 'Category already exist !!';
        }
        echo json_encode($json);
	    exit;
    }	
  }
}
