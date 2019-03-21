<?php

namespace App;

use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;


class ContactUs extends Model
{
    use Notifiable;


    protected $table = 'contact_us';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'subject','email','description','is_active','is_delete'
    ];

}
