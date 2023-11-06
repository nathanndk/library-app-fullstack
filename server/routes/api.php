<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\BooksController;
use App\Http\Controllers\Api\HistoryController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\RatingController;
use App\Http\Controllers\Api\RegisterController;
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
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('/logout', [AuthController::class, 'logout']);
});
Route::get('/userinfo', [AuthController::class, 'userinfo']);
Route::get('/userinfo/{access_token}', [AuthController::class, 'showuser']);

//Route::apiResource('/daftar', App\Http\Controllers\Api\BookController::class)->name('index', 'api.books.index');
Route::get('/daftar', [BooksController::class, 'index']);
Route::get('/detail/{id}', [BooksController::class, 'show']);
Route::post('/addbooks', [BooksController::class, 'store']);
Route::post('/feedback/{idbuku}', [RatingController::class, 'store']);
Route::get('/riwayat', [HistoryController::class, 'index']);