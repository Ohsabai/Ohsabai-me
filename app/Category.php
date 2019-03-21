<?php

namespace App;

use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;


class Category extends Model
{
    use Notifiable;


    protected $table = 'category';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category_name','parent_id','is_active','is_delete'
    ];

    public static function getCategoryNameById($id = NULL){
        if(!empty($id)){
            $category_name = Self::where("id",$id)->first()->category_name;    
        }else{
            $category_name = "-"; 
        }
        return $category_name;
    }
}
