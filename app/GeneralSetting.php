<?php

namespace App;

use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;


class GeneralSetting extends Model
{
    use Notifiable;

    protected $table = 'general_setting';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'site_name','site_logo','seo_title','seo_description','timezone','email','is_active','mobile_no','address','facebook_url','twitter_url','linkedin_url','insta_url','youtube_url','website','is_active','currency'
    ];

}
