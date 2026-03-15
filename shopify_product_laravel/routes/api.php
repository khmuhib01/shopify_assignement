<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\ApiProductController;

Route::prefix('product')->group(function () {

    Route::get('/list', [ApiProductController::class, 'index']);

    Route::post('/view', [ApiProductController::class, 'productView']);

    Route::post('/purchase', [ApiProductController::class, 'productPurchase']);

    Route::get('/{id}/stats', [ApiProductController::class, 'productStats']);

});
