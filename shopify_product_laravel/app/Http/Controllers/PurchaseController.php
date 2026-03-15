<?php

namespace App\Http\Controllers;

use App\Models\ProductPurchase;
use Illuminate\Http\Request;

class PurchaseController extends Controller
{
    public function index()
    {
        $purchases = ProductPurchase::orderBy('id', 'desc')->paginate(10);
        return view('purchases.index', compact('purchases'));
    }
}
