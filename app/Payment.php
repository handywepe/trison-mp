<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Payment extends Model
{
    //
    protected $fillable = [
        'project_id', 'pembayaran', 'tanggal',
    ];
}
