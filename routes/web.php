<?php

use App\Http\Controllers\CasaAmarelaController;
use App\Http\Controllers\CommentsController;
use App\Http\Controllers\ContactsController;
use App\Http\Controllers\ContribuisController;
use App\Http\Controllers\DimensionsController;
use App\Http\Controllers\EixosController;
use App\Http\Controllers\PostsController;
use App\Http\Controllers\UsersController;
use Illuminate\Support\Facades\Route;

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

Route::get('/', [CasaAmarelaController::class, 'index'])->name('/');
Route::get('/portfolio-details', [CasaAmarelaController::class, 'portDetails'])->name('portfolio-details');
Route::get('/blog', [CasaAmarelaController::class, 'blog'])->name('blog');
Route::get('/blog-single/{post}', [CasaAmarelaController::class, 'blogSingle'])->name('blog-single');
Route::post('contacts', [ContactsController::class, 'store'])->name('contacts.store');
Route::get('contacts/create', [ContactsController::class, 'create'])->name('contacts.create');
Route::get('contribuis/create', [ContribuisController::class, 'create'])->name('contribuis.create');
Route::post('contribuis', [ContribuisController::class, 'store'])->name('contribuis.store');
Route::post('comments', [CommentsController::class, 'store'])->name('comments.store');
Route::put('comments/{comment}', [CommentsController::class, 'update'])->name('comments.update');
Route::put('posts/{post}', [CasaAmarelaController::class, 'updatePost'])->name('posts.like');

Route::middleware(['auth:sanctum', 'verified'])->get('/dashboard', function () {
    return view('dashboard');
})->name('dashboard');

Route::group([
    'prefix' => 'unico', 'as' => 'unico.', 'middleware' => 'can:unico'
], function(){

});

Route::group([
    'prefix' => 'redat', 'as' => 'redat.', 'middleware' => 'can:redat'
], function (){
    Route::resource('dimensions', DimensionsController::class);
    Route::resource('eixos', EixosController::class);
    Route::get('contribuis/index', [ContribuisController::class, 'index'])->name('contribuis.index');
    Route::get('contribuis/{contribui}', [ContribuisController::class, 'show'])->name('contribuis.show');
    Route::get('contribuis/{contribui}/edit', [ContribuisController::class, 'edit'])->name('contribuis.edit');
    Route::delete('contribuis/{contribui}', [ContribuisController::class, 'destroy'])->name('contribuis.destroy');
});

Route::group([
    'prefix' => 'admin', 'as' => 'admin.', 'middleware' => 'can:admin'
], function (){
    Route::get('contacts/index', [ContactsController::class, 'index'])->name('contacts.index');
    Route::get('contacts/{contact}', [ContactsController::class, 'show'])->name('contacts.show');
    Route::get('contacts/{contact}/edit', [ContactsController::class, 'edit'])->name('contacts.edit');
    Route::put('contacts/{contact}', [ContactsController::class, 'update'])->name('contacts.update');
    Route::delete('contacts/{contact}', [ContactsController::class, 'destroy'])->name('contacts.destroy');
    Route::resource('users', UsersController::class);
    Route::resource('posts', PostsController::class);
    Route::get('posts/foto-upload/{post}', [PostsController::class, 'fotoUpload'])->name('posts.uploadFoto');
    Route::post('posts/resize-file', [PostsController::class, 'resizeImage'])->name('posts.resizeImage');
});
