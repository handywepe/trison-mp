<?php

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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::apiResources(['user' => 'API\UserController']);
Route::apiResources(['category' => 'API\CategoryController']);
Route::apiResources(['catproject' => 'API\CatProjectController']);
Route::apiResources(['product' => 'API\ProductController']);
Route::apiResources(['project' => 'API\ProjectController']);
Route::apiResources(['supplier' => 'API\SupplierController']);
Route::apiResources(['customer' => 'API\CustomerController']);
Route::apiResources(['productout' => 'API\ProductOutController']);
Route::apiResources(['productin' => 'API\ProductInController']);
Route::apiResources(['document' => 'API\DocumentController']);
Route::apiResources(['payment' => 'API\PaymentController']);

Route::post('undoaddout', 'API\ProductOutController@undoAddOut');
Route::post('undoaddin', 'API\ProductInController@undoAddIn');
Route::post('undoaddpay', 'API\PaymentController@undoAddPay');
Route::post('uploadpdf', 'API\ProjectController@uploadPdf');
Route::post('project/bymonth', 'API\ProjectController@byMonth');
Route::post('pembelian/bymonth', 'API\ProductInController@byMonth');
Route::post('penjualan/bymonth', 'API\ProductOutController@byMonth');
Route::post('docproject', 'API\DocumentController@showByProject');
Route::post('payproject', 'API\PaymentController@showByProject');
Route::get('setting', 'API\UserController@userLogin');
Route::put('setting', 'API\UserController@saveSetting');
Route::get('cekqty/{id}', 'API\ProductController@cekQty');

//Dashboard
Route::get('userdb', 'API\UserController@userDB');
Route::get('categorydb', 'API\CategoryController@categoryDB');
Route::get('productdb', 'API\ProductController@productDB');
Route::get('projectdb', 'API\ProjectController@projectDB');
Route::get('supplierdb', 'API\SupplierController@supplierDB');
Route::get('customerdb', 'API\CustomerController@customerDB');
Route::get('productoutdb', 'API\ProductOutController@productoutDB');
Route::get('productindb', 'API\ProductInController@productinDB');

