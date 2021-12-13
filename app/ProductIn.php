<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductIn extends Model
{
    //
    protected $table = 'product_ins';

    protected $fillable = ['product_id','supplier_id','qty','tanggal'];
}
