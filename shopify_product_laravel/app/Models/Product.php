<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Str;
class Product extends Model
{

    protected $guarded = [];


    public function views()
    {
        return $this->hasMany(ProductView::class);
    }


     public function views_today()
        {
            return $this->hasMany(ProductView::class,'product_id','id')->whereDate('created_at', now()->toDateString());
        }

         public function purchases_today()
         {
             return $this->hasMany(ProductPurchase::class,'product_id','id')->whereDate('created_at', now()->toDateString());
         }

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            if (empty($model->uuid)) {
                $model->uuid = (string) Str::uuid();
            }
        });
    }
}
