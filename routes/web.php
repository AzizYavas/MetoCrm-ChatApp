<?php

use App\Http\Middleware\UpdateLastActivity;
use Illuminate\Support\Facades\Route;

Route::middleware([UpdateLastActivity::class])->group(function () {

    Route::view('/', 'welcome');

    Route::view('dashboard', 'dashboard')
        ->middleware(['auth', 'verified'])
        ->name('dashboard');

    Route::view('profile', 'profile')
        ->middleware(['auth'])
        ->name('profile');
        
});

require __DIR__ . '/auth.php';
