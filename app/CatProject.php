<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class CatProject extends Model
{
    //
    protected $table = 'cat_projects';

    protected $fillable = [
        'nama',
    ];
}
