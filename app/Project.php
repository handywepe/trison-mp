<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Project extends Model
{
    //
    protected $guarded = [
        'created_at', 'updated_at'
    ];
}
