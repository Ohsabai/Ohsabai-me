<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Spatie\Permission\Traits\HasRoles;
use DB;

class User extends Authenticatable
{
    use Notifiable;

    use HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'mobile_no','password','address','lat','lng','distance','image','is_active','is_delete','reset_password_token','term_condition','remember_token','email_verified_at','qualified','region_id','gender','year','provide_treatment','transport_mode','working_area'
    ];

    protected $hidden = [
        'password', 'remember_token',
    ];

    public static function getRole($id =NULL){
        $role_obj = DB::table('model_has_roles')->where('model_id',$id)->first();

        if(!empty($role_obj)){
            $role_id = $role_obj->role_id; 
        }else{
           $role_id = 0;   
        }
        return $role_id;
    }   

}
