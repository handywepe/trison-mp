<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\ProductIn;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProductInController extends Controller
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
        $date = date("Y-m-d");
        $thismonth = substr($date, 5, 2);
        $thisyear = substr($date, 0, 4);
        $productIn = ProductIn::whereMonth('tanggal', '=', $thismonth)->whereYear('tanggal', '=', $thisyear)
        ->leftjoin('products', 'products.id', '=', 'product_ins.product_id')
        ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
        ->leftjoin('suppliers', 'suppliers.id', '=', 'product_ins.supplier_id')
        ->select('product_ins.id', 'product_ins.product_id', 'product_ins.supplier_id',
                (DB::raw('CONCAT(categories.nama, " ", products.merek, " ", products.tipe) AS namaProduct')),
                (DB::raw('products.harga_modal * product_ins.qty AS pengeluaran')),
                'suppliers.nama AS namaSupplier', 'product_ins.qty', 'product_ins.tanggal')
        ->orderBy('product_ins.updated_at', 'DESC')
        ->get();

        return $productIn;
    }

    public function byMonth(Request $request)
    {
        //
        $dateYear = substr($request->tanggal, 0, 4);
        $month = substr($request->tanggal, 5, 2);
        $project = ProductIn::whereMonth('tanggal', '=', $month)->whereYear('tanggal', '=', $dateYear)
        ->leftjoin('products', 'products.id', '=', 'product_ins.product_id')
        ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
        ->leftjoin('suppliers', 'suppliers.id', '=', 'product_ins.supplier_id')
        ->select('product_ins.id', 'product_ins.product_id', 'product_ins.supplier_id',
                (DB::raw('CONCAT(categories.nama, " ", products.merek, " ", products.tipe) AS namaProduct')),
                (DB::raw('products.harga_modal * product_ins.qty AS pengeluaran')),
                'suppliers.nama AS namaSupplier', 'product_ins.qty', 'product_ins.tanggal')
        ->orderBy('product_ins.updated_at', 'DESC')
        ->get();

        return $project;
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
    public function store(Request $request)
    {
        //
        $this->validate($request, [
            'product_id' => 'required',
            'supplier_id' => 'required',
            'tanggal' => 'required',
            'qty' => 'required|numeric|min:0|not_in:0',
        ]);

        ProductIn::create($request->all());

        $product = Product::findOrFail($request->product_id);
        $product->qty += $request->qty;
        $product->save();

        return ['message' => "success"];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ProductIn  $productIn
     * @return \Illuminate\Http\Response
     */
    public function show(ProductIn $productIn)
    {
        //
        return $productIn;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ProductIn  $productIn
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductIn $productIn)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ProductIn  $productIn
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductIn $productIn)
    {
        //
        $this->validate($request, [
            'product_id' => 'required',
            'supplier_id' => 'required',
            'tanggal' => 'required',
            'qty' => 'required|numeric|min:0|not_in:0',
        ]);

        $productIn = ProductIn::findOrFail($request->id);
        $productIn->update($request->all());

        $product = Product::findOrFail($request->product_id);
        $product->qty += $request->qtyNew;
        $product->update();

        return ['message' => "success"];
    }

    public function undoAddIn(Request $request)
    {
        $product = Product::findOrFail($request->product_id);
        $product->qty -= $request->qty;
        $product->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\ProductIn  $productIn
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $productIn = ProductIn::findOrFail($id);
        $productIn->delete();
        return ['message' => 'Delete Succes'];
    }

    public function productinDB()
    {
        $month = date('m');
        $query = DB::table("product_ins")
            ->leftjoin('products', 'products.id', '=', 'product_ins.product_id')
            ->select('product_ins.id', DB::raw('products.harga_modal * product_ins.qty AS pengeluaran') )
            ->whereMonth('product_ins.tanggal', '=', $month)
            ->get();

        $sumQuery = $query->sum('pengeluaran');

        //month before
        $monthBfr = date('m')-1;
        $queryBfr = DB::table("product_ins")
            ->leftjoin('products', 'products.id', '=', 'product_ins.product_id')
            ->select('product_ins.id', DB::raw('products.harga_modal * product_ins.qty AS pengeluaran') )
            ->whereMonth('product_ins.tanggal', '=', $monthBfr)
            ->get();

        $sumQueryBfr = $queryBfr->sum('pengeluaran');
        $showPercent = null;
        if ($sumQueryBfr !== 0) {
            $percentUpDown = ($sumQuery - $sumQueryBfr) / $sumQueryBfr * 100;
            $showPercent = substr($percentUpDown, 0, (strpos($percentUpDown, '.')+3));
        }

        return ['thisMonth'=>$sumQuery,'monthBefore'=>$sumQueryBfr, 'percent'=>$showPercent ];
    }
}
