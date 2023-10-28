<?php

use App\Http\Controllers\Api\BooksController;
use App\Http\Controllers\Api\HistoryController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware(['auth:sanctum'])->get('/user', function (Request $request) {
    return $request->user();
});

//Route::apiResource('/daftar', App\Http\Controllers\Api\BookController::class)->name('index', 'api.books.index');
Route::get('/daftar', [BooksController::class, 'index']);
Route::get('/detail/{id}', [BooksController::class, 'show']);
Route::post('/daftar', [BooksController::class, 'store']);
Route::get('/riwayat', [HistoryController::class, 'index']);