<?php

namespace App;

use Illuminate\Notifications\Notifiable;

use Illuminate\Database\Eloquent\Model;


class Cms extends Model
{
    use Notifiable;


    protected $table = 'cms_page';
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'page_name','page_slug','short_description','content','image','meta_title','meta_description','is_active','is_delete'
    ];

}
