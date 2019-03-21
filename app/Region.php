<?php

namespace App;

use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;


class Region extends Model
{
    use Notifiable;


    protected $table = 'region';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'city_name','is_active','is_delete'
    ];

}
