<?php
namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use DB;
use App\Cms;
use App\Booking;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;

class StarreviewController extends Controller
{
    public function index(){

      $data['therapist'] =  DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
        ->where(['users.is_active'=>'1','users.is_delete'=>'0','model_has_roles.role_id'=>2])->orderBy('id','desc')->get();

        $data['users'] =  DB::table('users')->join('model_has_roles', 'users.id', '=', 'model_has_roles.model_id')
        ->where(['users.is_active'=>'1','users.is_delete'=>'0','model_has_roles.role_id'=>3])->orderBy('id','desc')->get();

    	return view('admin.star-review.list',$data);
    }

    public function getList(Request $request){

      $where['booking.is_delete']  = 0;

      if(!empty($request->therapist_filter)){
          $where['booking.therapist_id']  = $request->therapist_filter;                
      }

      if(!empty($request->user_filter)){
          $where['booking.user_id']  = $request->user_filter;                
      }
      if(!empty($request->star_filter)){
          $where['booking.feedback_star']  = $request->star_filter;                
      }
      
    	$booking = Booking::whereNotNull('feedback_star')->where($where)->orderBy('id','desc')->get(); 
        return Datatables::of($booking)

        ->addColumn('therapist_name',function($booking){
           return get_user_name_by_id($booking->therapist_id);
        })

        ->addColumn('user_name',function($booking){
           return  get_user_name_by_id($booking->user_id);
        })

        ->addColumn('feedback_star',function($booking){
             

          $star_1 = "";
          $star_2 = "";
          $star_3 = "";  
          $star_4 = "";
          $star_5 = "";
          if($booking->feedback_star >= 1) {
                $star_1 = "selected";
          }
          if($booking->feedback_star >= 2) {
                $star_2 = "selected";
          }
          if($booking->feedback_star >= 3) {
                $star_3 = "selected";
          }
          if($booking->feedback_star >= 4) {
                $star_4 = "selected";
          }
          if($booking->feedback_star >= 5) {
                $star_5 = "selected";
          }  

 
          return "<section class='rating-widget'>
                              <div class='rating-stars text-center'>
                                  <ul id=''>
                                     <li class='star ".$star_1."'>
                                        <i class='fa fa-star fa-fw'></i>
                                     </li>
                                     <li class='star ".$star_2."'>
                                        <i class='fa fa-star fa-fw'></i>
                                     </li>
                                     <li class='star ".$star_3."'>
                                        <i class='fa fa-star fa-fw'></i>
                                     </li>
                                     <li class='star ".$star_4."'>
                                        <i class='fa fa-star fa-fw'></i>
                                     </li>
                                     <li class='star ".$star_5."'>
                                        <i class='fa fa-star fa-fw'></i>
                                     </li>
                                  </ul>
                               </div> <br />
                               <div class='text-center' style='width:50%; margin-left: 25%'>
                                 <div >
                                      <?php echo $booking->feedback_desc; ?>
                                  </div>
                               </div><br />
                               <div class='text-center' style='width:50%; margin-left: 25%'>
                                  
                               </div>
                            </section>"; 
        })
    
        ->rawColumns(['image','therapist_name','user_name','feedback_star'])
        ->make(true);
    }
}


