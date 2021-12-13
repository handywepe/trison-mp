<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Supplier;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SupplierController extends Controller
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
        $supplier = Supplier::all();
        return $supplier;
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
            'nama' => 'required|string|max:191',
            'perusahaan' => 'required|string|max:191|unique:suppliers',
        ]);

        Supplier::create($request->all());
        return ['message' => "success"];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function show(Supplier $supplier)
    {
        //
        return $supplier;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function edit(Supplier $supplier)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Supplier $supplier)
    {
        //
        $this->validate($request, [
            'nama' => 'required',
            'perusahaan' => 'required|string|max:191|unique:suppliers,perusahaan,'.$supplier->id,
        ]);

        $supplier->update($request->all());
        return ['message' => "success"];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Supplier  $supplier
     * @return \Illuminate\Http\Response
     */
    public function destroy(Supplier $supplier)
    {
        //
        $supplier->delete();
        return ['message' => 'Delete Success'];
    }

    public function supplierDB()
    {
        $supplier = DB::table('suppliers')->count();
        return $supplier;
    }
}
