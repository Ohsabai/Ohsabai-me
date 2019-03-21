<?php

namespace App;

use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;


class Booking extends Model
{
    use Notifiable;


    protected $table = 'booking';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id','booking_id','user_id','therapist_id','treatment_id','booking_type','duration_id','is_active','pricing_id','booking_date','booking_time','mobile_no','name','house_no','street_name','zipcode','city','total_amount','is_active','is_delete','created_at','updated_at','additional_notes'
    ];
}
