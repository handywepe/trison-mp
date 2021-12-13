<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    //
    protected $fillable = [
        'merek', 'tipe', 'category_id', 'harga', 'harga_modal', 'image', 'qty', 'keterangan'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }
}
