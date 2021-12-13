<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        // $product = Product::all();
        $product = DB::table('categories')->rightjoin('products', 'products.category_id', '=', 'categories.id')
        ->select('products.id', 'products.merek', 'products.tipe', 'products.keterangan', 'products.qty', 'products.harga',
        (DB::raw('CONCAT(products.merek, " ", products.tipe) AS namaProduct')),
        'products.harga_modal', 'products.spec', 'products.image', 'products.category_id', 'categories.nama AS kategori', )
        ->get();
        return $product;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, Product $product)
    {
        //

        $this->validate($request, [
            'merek' => 'sometimes|max:191',
            'tipe' => [
                Rule::unique('products')->where(function ($query) use ($request) {
                    return $query->where('category_id', $request->category_id)
                   ->where('merek', $request->merek);
                })
            ],
            'category_id' => 'required',
            'harga' => 'required|numeric|min:0|not_in:0',
            'harga_modal' => 'nullable|numeric|min:0|not_in:0',
            'qty' => 'sometimes|numeric|min:0',
        ]);

        $image = 'product.jpg';

        if(!empty($request->image)){
            $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];

            \Image::make($request->image)->resize(null, 1000, function ($constraint) {
                $constraint->aspectRatio();
            })->save(public_path('images/product/').$name);
            $request->merge(['image' => $name]);
        }

        if($request->image === null ){
            $request->merge(['image' => $image ]);
        }

        Product::create($request->all());
        return ['message' => "success"];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        //
        return $product;
    }

    public function cekQty($id)
    {
        //
        $product = DB::table('products')->where('id', '=', $id)->select('id','qty')->get();
        return $product;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        //
        $this->validate($request, [
            'merek' => 'required|string|max:191',
            'tipe' => [
                'required',
                Rule::unique('products')->where(function ($query) use ($request) {
                    return $query->where('category_id', $request->category_id)
                   ->where('merek', $request->merek);
                })->ignore($product->id)
            ],
            // 'tipe' => 'sometimes|string|max:191|unique:products,tipe,'.$product->id,
            'category_id' => 'required',
            'harga' => 'required|numeric|min:0|not_in:0',
            'harga_modal' => 'nullable|numeric|min:0|not_in:0',
            // 'qty' => 'required|numeric|min:0',
        ]);

        $currentImage = $product->image;
        if($request->image != $currentImage){

            $name = time().'.' . explode('/', explode(':', substr($request->image, 0, strpos($request->image, ';')))[1])[1];

            \Image::make($request->image)->resize(null, 1000, function ($constraint) {
                $constraint->aspectRatio();
            })->save(public_path('images/product/').$name);
            $request->merge(['image' => $name]);

            $productImage = public_path('images/product/').$currentImage;
            if(file_exists($productImage) && $currentImage !="product.jpg"){
                @unlink($productImage);
            }

        }

        $product->update($request->all());
        return ['message' => "success"];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        $currentImage = $product->image;
        $productImage = public_path('images/product/').$currentImage;
            if(file_exists($productImage) && $currentImage !="product.jpg"){
                @unlink($productImage);
            }
        $product->delete();
        return ['message' => 'Delete Success'];
    }

    public function productDB()
    {
        $product = DB::table('products')->count();
        // $productRemain = DB::table('products')->where('qty', '<', 10)->select('id', 'nama', 'qty')->take(5)->get();
        $productRemain = DB::table('categories')->rightjoin('products', 'products.category_id', '=', 'categories.id')
            ->where('products.qty', '<=', 10)
            ->select('products.qty', (DB::raw('CONCAT(products.merek, " ", products.tipe) AS namaProduct')))
            ->take(5)->get();
        return ['jumlah'=>$product,'productRemain'=>$productRemain,];
    }
}
