<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductOut extends Model
{
    //
    protected $table = 'product_outs';

    protected $fillable = ['product_id','customer_id','qty','tanggal'];

    // public function product()
    // {
    //     return $this->belongsTo(Product::class);
    // }

    // public function customer()
    // {
    //     return $this->belongsTo(Customer::class);
    // }
}
