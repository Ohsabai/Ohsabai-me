<?php

namespace App;

use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;


class Treatment extends Model
{
    use Notifiable;


    protected $table = 'treatments';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'category_id','treatment_name','image','overview','treatment','faq','created_by','is_active','is_delete'
    ];
}
