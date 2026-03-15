<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductView;
use App\Models\ProductPurchase;

class ApiProductController extends Controller
{
    public function index()
    {
        $products = \App\Models\Product::withCount('views')->where('status', 'active')->get();
        return response()->json([
            'status'=>true,
            'message'=>'Products retrieved successfully',
            'data'=>$products
        ]
        );
    }



    public function productView(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required',
        ]);

        $product = Product::withCount(['views', 'views_today', 'purchases_today'])
            ->where('id', $validated['product_id'])
            ->orWhere('uuid', $validated['product_id'])
            ->firstOrFail();

        $productView = new ProductView();
        $productView->product_id = $product->id;
        $productView->save();

        return response()->json([
            'status' => true,
            'message' => 'Product view recorded successfully',
            'data' => $product // Compatibility for old React app
        ], 200);
    }

    public function productPurchase(Request $request)
    {
        $validated = $request->validate([
            'product_id' => 'required',
        ]);

        $product = Product::where('id', $validated['product_id'])
            ->orWhere('uuid', $validated['product_id'])
            ->firstOrFail();

        $productPurchase = new ProductPurchase();
        $productPurchase->product_id = $product->id;
        $productPurchase->product_name = $product->product_name;
        $productPurchase->price = $product->price;
        $productPurchase->status = 'completed';
        $productPurchase->save();

        return response()->json([
            'status' => true,
            'message' => 'Product purchase recorded successfully',
            'data' => $productPurchase
        ], 200);
    }

    public function productStats($id)
    {
        $product = Product::withCount(['views_today', 'purchases_today'])
            ->where('id', $id)
            ->orWhere('uuid', $id)
            ->firstOrFail();

        // Assignment required format
        $response = [
            'product_id' => $product->id,
            'views_today' => $product->views_today_count,
            'purchases_today' => $product->purchases_today_count
        ];

        // Add 'data' wrapper for backward compatibility with old React app
        return response()->json(array_merge($response, [
            'status' => true,
            'data' => [
                'views_today_count' => $product->views_today_count,
                'purchases_today_count' => $product->purchases_today_count,
                'product_name' => $product->product_name,
                'image_url' => $product->image_url,
                'price' => $product->price,
                'description' => $product->description,
                'status' => $product->status
            ]
        ]), 200);
    }
}
