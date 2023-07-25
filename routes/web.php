<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\CrewController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::middleware("auth")->group(function() {
    Route::get('/dashboard',  [CrewController::class, 'view'])->name('dashboard');

    Route::get("/crew_form", [CrewController::class, 'create'])->name("crew_form");
    Route::get("/crew/{id}/edit", [CrewController::class, "editCrew"])->name("edit_crew_form");
    Route::get("/crew/{id}", [CrewController::class, "viewCrew"])->name("view_crew");

    Route::get("/accounts", [UserController::class, 'view'])->name("accounts");
});



require __DIR__.'/auth.php';
