<?php

namespace App;

use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;


class Pricing extends Model
{
    use Notifiable;


    protected $table = 'pricing';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'time','price','is_active','is_delete'
    ];

}
