<?php

namespace App;

use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;


class Subscribe extends Model
{
    use Notifiable;


    protected $table = 'subscribe';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id','email','created_at','updated_at','is_active','is_delete'
    ];
}
