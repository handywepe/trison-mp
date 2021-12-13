<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\ProductOut;
use App\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class ProductOutController extends Controller
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
        $productOut = ProductOut::whereMonth('tanggal', '=', $thismonth)->whereYear('tanggal', '=', $thisyear)
        ->leftjoin('products', 'products.id', '=', 'product_outs.product_id')
        ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
        ->leftjoin('customers', 'customers.id', '=', 'product_outs.customer_id')
        ->select('product_outs.id', 'product_outs.product_id', 'product_outs.customer_id',
                (DB::raw('CONCAT(categories.nama, " ", products.merek, " ", products.tipe) AS namaProduct')),
                (DB::raw('products.harga * product_outs.qty AS pemasukan')),
                'customers.nama AS namaCustomer', 'product_outs.qty', 'product_outs.tanggal')
        ->orderBy('product_outs.tanggal', 'DESC')
        ->get();

        return $productOut;

    }

    public function byMonth(Request $request)
    {
        //
        $dateYear = substr($request->tanggal, 0, 4);
        $month = substr($request->tanggal, 5, 2);
        $project = ProductOut::whereMonth('tanggal', '=', $month)->whereYear('tanggal', '=', $dateYear)
        ->leftjoin('products', 'products.id', '=', 'product_outs.product_id')
        ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
        ->leftjoin('customers', 'customers.id', '=', 'product_outs.customer_id')
        ->select('product_outs.id', 'product_outs.product_id', 'product_outs.customer_id',
                (DB::raw('CONCAT(categories.nama, " ", products.merek, " ", products.tipe) AS namaProduct')),
                (DB::raw('products.harga * product_outs.qty AS pemasukan')),
                'customers.nama AS namaCustomer', 'product_outs.qty', 'product_outs.tanggal')
        ->orderBy('product_outs.tanggal', 'DESC')
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
            'tanggal' => 'required',
            'qty' => 'required|numeric|min:0|not_in:0',
        ]);

        ProductOut::create($request->all());

        $product = Product::findOrFail($request->product_id);
        $product->qty -= $request->qty;
        $product->save();

        return ['message' => "success"];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\ProductOut  $productOut
     * @return \Illuminate\Http\Response
     */
    public function show(ProductOut $productOut)
    {
        //
        return $productOut;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\ProductOut  $productOut
     * @return \Illuminate\Http\Response
     */
    public function edit(ProductOut $productOut)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\ProductOut  $productOut
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ProductOut $productOut)
    {
        //
        $this->validate($request, [
            'product_id' => 'required',
            'tanggal' => 'required',
            'qty' => 'required|numeric|min:0|not_in:0',
        ]);

        $productOut = ProductOut::findOrFail($request->id);
        $productOut->update($request->all());

        $product = Product::findOrFail($request->product_id);
        $product->qty -= $request->qtyNew;
        $product->update();

        return ['message' => "success"];
    }

    public function undoAddOut(Request $request)
    {
        $product = Product::findOrFail($request->product_id);
        $product->qty += $request->qty;
        $product->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\ProductOut  $productOut
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $productOut = ProductOut::findOrFail($id);
        $productOut->delete();
        return ['message' => 'Delete Succes'];
    }

    public function productoutDB()
    {
        $month = date('m');
        $query = DB::table("product_outs")
            ->leftjoin('products', 'products.id', '=', 'product_outs.product_id')
            ->select('product_outs.id', (DB::raw('products.harga * product_outs.qty AS pemasukan')))
            ->whereMonth('product_outs.tanggal', '=', $month)
            ->get();

        $queryMdl = DB::table("product_outs")
            ->leftjoin('products', 'products.id', '=', 'product_outs.product_id')
            ->select('product_outs.id', (DB::raw('products.harga_modal * product_outs.qty AS modal')))
            ->whereMonth('product_outs.tanggal', '=', $month)
            ->get();

        $sumQuery = $query->sum('pemasukan');
        $sumModal = $queryMdl->sum('modal');

        //month before
        $monthBfr = date('m')-1;
        $queryBfr = DB::table("product_outs")
            ->leftjoin('products', 'products.id', '=', 'product_outs.product_id')
            ->select('product_outs.id', (DB::raw('products.harga * product_outs.qty AS pemasukan')))
            ->whereMonth('product_outs.tanggal', '=', $monthBfr)
            ->get();

        $sumQueryBfr = $queryBfr->sum('pemasukan');
        $showPercent = null;
        if ($sumQueryBfr !== 0) {
            $percentUpDown = ($sumQuery - $sumQueryBfr) / $sumQueryBfr * 100;
            $showPercent = substr($percentUpDown, 0, (strpos($percentUpDown, '.')+3));
        }
        $keuntungan = $sumQuery - $sumModal;

        //penjualan terbanyak
        $bestSales = DB::table("product_outs")
            ->whereMonth('tanggal', '=', $month)
            ->leftjoin('products', 'products.id', '=', 'product_outs.product_id')
            ->leftJoin('categories', 'categories.id', '=', 'products.category_id')
            ->select(DB::raw('SUM(product_outs.qty) as sumQty'), DB::raw('CONCAT(categories.nama, " ", products.merek, " ", products.tipe) AS namaProduct') )
            ->groupBy('namaProduct')
            ->orderBy('sumQty', 'desc')
            ->take(3)
            ->get();

        return ['thisMonth'=>$sumQuery,'monthBefore'=>$sumQueryBfr, 'bestSales'=>$bestSales, 'percent'=>$showPercent, 'keuntungan'=>$keuntungan ];
    }
}
