<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use DB;
use App\GeneralSetting;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Traits\HasRoles;
use Yajra\Datatables\Datatables;
use Validator;
use Auth;


class SettingController extends Controller
{
    public function index(){
        $data['setting'] = GeneralSetting::where("id",1)->first();
    	return view('admin.setting.index',$data);
    }

    public function store_setting(Request $request){

        if ($request->isMethod('post')) {

            $request->validate([
                'site_name' => 'required',
            ]);

            $setting = GeneralSetting::where("id",$request->id)->first();

            $customImageName ="";

            if(empty($setting)){
                if ($file = $request->hasFile('image')) {
                    $file            = $request->file('image');
                    $customImageName  = time() . '.' . $file->getClientOriginalExtension();
                    $destinationPath = storage_path() . '/app/site_logo/';
                    $file->move($destinationPath, $customImageName);
                }

                $data = GeneralSetting::create([
                    'site_name' => $request->site_name,
                    'site_logo' => $customImageName,
                    'seo_title' => $request->seo_title,
                    'seo_description' => $request->seo_description,
                    'timezone' => $request->timezone,
                    'currency' => $request->currency,
                    'email' => $request->email,
                    'mobile_no' => $request->mobile_no,
                    'address' => $request->address,
                    'facebook_url' => $request->facebook_url,
                    'linkedin_url' => $request->linkedin_url,
                    'twitter_url' => $request->twitter_url,
                    'insta_url' => $request->insta_url,
                    'youtube_url' => $request->youtube_url,
                    'website' => $request->website,
                ]);

            }else{

                if ($file = $request->hasFile('image')) {
                    $file            = $request->file('image');
                    $customImageName  = time() . '.' . $file->getClientOriginalExtension();
                    $destinationPath = public_path() . '/uploads/setting/';
                    $file->move($destinationPath, $customImageName);
                    if (!empty($setting->site_logo) && file_exists(public_path() . '/uploads/setting/'.$setting->site_logo)) {
                        unlink(public_path() . '/uploads/setting/'.$setting->site_logo);
                    }
                }

                $data = GeneralSetting::where('id',$setting->id)->update([
                    'site_name' => $request->site_name,
                    'seo_title' => $request->seo_title,
                    'seo_description' => $request->seo_description,
                    'timezone' => $request->timezone,
                    'email' => $request->email,
                    'mobile_no' => $request->mobile_no,
                    'currency' => $request->currency,
                    'address' => $request->address,
                    'facebook_url' => $request->facebook_url,
                    'linkedin_url' => $request->linkedin_url,
                    'twitter_url' => $request->twitter_url,
                    'insta_url' => $request->insta_url,
                    'youtube_url' => $request->youtube_url,
                    'website' => $request->website,
                ]);

                if(!empty($customImageName)){
                   GeneralSetting::where("id",$setting->id)->update([
                        'site_logo' =>$customImageName
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
}
