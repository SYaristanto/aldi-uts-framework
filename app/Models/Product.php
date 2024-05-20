<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 
        'category_id',
        'description', 
        'price', 
        'image', 
        'expired_at', 
        'modified_by'
    ];

    // public function Categories(){
    //     return $this->belongsTo(Categories::class);
    // }
}
