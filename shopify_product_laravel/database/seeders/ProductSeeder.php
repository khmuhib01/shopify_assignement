<?php

namespace Database\Seeders;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Illuminate\Database\Seeder;

class ProductSeeder extends Seeder
{
    public function run(): void
    {
        DB::table('products')->insert([
            [
                'uuid' => Str::uuid(),
                'product_name' => 'Three piece suit',
                'price' => 199.99,
                'description' => 'Elegant three-piece suit for formal occasions.',
                'image_url' => '1639378035XJWgisPU.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'uuid' => Str::uuid(),
                'product_name' => 'Mosh Keyboard',
                'price' => 74.50,
                'description' => 'RGB mechanical gaming keyboard.',
                'image_url' => '1639378418BxWim5Uq.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'uuid' => Str::uuid(), // <-- Add this line
                'product_name' => 'Car Seat',
                'price' => 29.99,
                'description' => 'Fast charging USB-C adapter.',
                'image_url' => '1639392364Li5C3bEO.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'uuid' => Str::uuid(),
                'product_name' => 'Books',
                'price' => 89.99,
                'description' => 'Elegant three-piece suit for formal occasions.',
                'image_url' => '1639392531mZxqr9sa.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'uuid' => Str::uuid(),
                'product_name' => 'Tree Shirt',
                'price' => 129.00,
                'description' => 'Fitness tracking smart watch with heart rate monitor.',
                'image_url' => '1639392738TGJsX6up.jpg',
                'status' => 'active',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            // add the rest similarly, every row must include 'uuid'
        ]);

       $products = DB::table('products')->get();

        foreach ($products as $product) {

            DB::table('product_purchases')->insert([
                'uuid' => Str::uuid(),
                'product_id' => $product->id,
                'product_name' => $product->product_name,
                'price' => $product->price,
                'description' => $product->description,
                'image_url' => $product->image_url,
                'payment_method' => 'cash_on_delivery',
                'status' => 'pending',
                'created_at' => now(),
                'updated_at' => now(),
            ]);

        }
        foreach ($products as $product) {

            DB::table('product_purchases')->insert([
                'uuid' => Str::uuid(),
                'product_id' => $product->id,
                'product_name' => $product->product_name,
                'price' => $product->price,
                'description' => $product->description,
                'image_url' => $product->image_url,
                'payment_method' => 'cash_on_delivery',
                'status' => 'pending',
                'created_at' => now(),
                'updated_at' => now(),
            ]);

        }

    }
}
