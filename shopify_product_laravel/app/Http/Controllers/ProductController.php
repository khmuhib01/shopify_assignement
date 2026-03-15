<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Product;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::withCount('views')->orderBy('id', 'desc')->get();
        return view('dashboard', compact('products'));
    }

    public function create()
    {
        return view('products.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'product_name' => 'required',
            'price' => 'required|numeric',
            'description' => 'nullable',
            'status' => 'required|in:active,inactive',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $data = $request->except('image');
        
        if ($request->hasFile('image')) {
            $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('assets/img'), $imageName);
            $data['image_url'] = $imageName;
        }

        Product::create($data);

        return redirect()->route('dashboard')->with('success', 'Product created successfully.');
    }

    public function edit(Product $product)
    {
        return view('products.edit', compact('product'));
    }

    public function update(Request $request, Product $product)
    {
        $request->validate([
            'product_name' => 'required',
            'price' => 'required|numeric',
            'description' => 'nullable',
            'status' => 'required|in:active,inactive',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $data = $request->except('image');

        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($product->image_url && file_exists(public_path('assets/img/' . $product->image_url))) {
                @unlink(public_path('assets/img/' . $product->image_url));
            }

            $imageName = time().'.'.$request->image->extension();  
            $request->image->move(public_path('assets/img'), $imageName);
            $data['image_url'] = $imageName;
        }

        $product->update($data);

        return redirect()->route('dashboard')->with('success', 'Product updated successfully.');
    }

    public function destroy(Product $product)
    {
        if ($product->image_url && file_exists(public_path('assets/img/' . $product->image_url))) {
            @unlink(public_path('assets/img/' . $product->image_url));
        }
        
        $product->delete();
        return redirect()->route('dashboard')->with('success', 'Product deleted successfully.');
    }
}
