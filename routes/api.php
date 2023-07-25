<?php

use Illuminate\Http\Request;
use App\Http\Controllers\CrewController;
use App\Http\Controllers\DocumentController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::post('/crews', [CrewController::class, 'store'])->name("store_crew");
Route::put('/crews/{id}', [CrewController::class, 'update'])->name("update_crew");
Route::delete('/crews/{id}', [CrewController::class, 'delete'])->name("delete_crew");

Route::post("/crews/{crewId}/documents", [DocumentController::class, 'store'])->name("store_document");
Route::put("/crews/{crewId}/documents/{documentId}", [DocumentController::class, "update"])->name("update_document");
Route::delete("/crews/{crewId}/documents/{documentId}", [DocumentController::class, "delete"])->name("delete_document");
