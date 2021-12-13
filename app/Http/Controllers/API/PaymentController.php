<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Payment;
use App\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentController extends Controller
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
            'pembayaran' => 'required|numeric|min:100',
            'tanggal' => 'required',
        ]);

        Payment::create($request->all());

        $project = Project::findOrFail($request->project_id);
        $project->pembayaran += $request->pembayaran;
        $project->sisa_pembayaran -= $request->pembayaran;
        $project->save();

        return ['message' => "success"];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function showByProject(Request $request)
    {
        //
        $project = $request->id;
        $payment = DB::table('payments')
        ->where('project_id', '=', $project )
        ->orderBy('tanggal', 'asc')
        ->get();

        return $payment;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function show(Payment $payment)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function edit(Payment $payment)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Payment $payment)
    {
        //
    }

    public function undoAddPay(Request $request)
    {
        $project = Project::findOrFail($request->project_id);
        $project->pembayaran -= $request->pembayaran;
        $project->sisa_pembayaran += $request->pembayaran;
        $project->save();
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Payment  $payment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Payment $payment)
    {
        //
        $payment->delete();
        return ['message' => 'Delete Succes'];
    }
}
