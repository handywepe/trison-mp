<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Project;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProjectController extends Controller
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
        $user = auth('api')->user();
        $date = date("Y-m-d");
        $thismonth = substr($date, 5, 2);
        $thisyear = substr($date, 0, 4);
        if ($user->type === 'produksi') {
            $project = Project::whereMonth('tanggal_masuk', '=', $thismonth)->whereYear('tanggal_masuk', '=', $thisyear)->where(function($query){
                $query->where('status', '=', 'Produksi')->orWhere('status', '=', 'Selesai')->orWhere('status', '=', 'Dikirim');
            })
            ->join('customers', 'customers.id', '=', 'projects.customer_id')
            ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
            ->select('projects.id', 'projects.nama_project', 'projects.customer_id', 'customers.nama AS namaCustomer',
            'projects.cat_project_id', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.satuan',
            'projects.size', 'projects.spec', 'projects.spec_cover', 'projects.finishing', 'projects.file',
            'projects.tanggal_masuk', 'projects.deadline', 'projects.tanggal_selesai', 'projects.tanggal_kirim',
            'projects.harga', 'projects.harga_modal', 'projects.pembayaran', 'projects.sisa_pembayaran',
            'projects.status')
            ->orderBy('projects.tanggal_masuk', 'desc')
            ->get();
        }else {
            $project = Project::whereMonth('tanggal_masuk', '=', $thismonth)->whereYear('tanggal_masuk', '=', $thisyear)
            ->join('customers', 'customers.id', '=', 'projects.customer_id')
            ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
            ->select('projects.id', 'projects.nama_project', 'projects.customer_id', 'customers.nama AS namaCustomer',
            'projects.cat_project_id', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.satuan',
            'projects.size', 'projects.spec', 'projects.spec_cover', 'projects.finishing', 'projects.file',
            'projects.tanggal_masuk', 'projects.deadline', 'projects.tanggal_selesai', 'projects.tanggal_kirim',
            'projects.harga', 'projects.harga_modal', 'projects.pembayaran', 'projects.sisa_pembayaran',
            'projects.status')
            ->orderBy('projects.tanggal_masuk', 'desc')
            ->get();
        }

        return $project;
    }

    public function byMonth(Request $request)
    {
        //
        $user = auth('api')->user();
        $dateYear = substr($request->tanggal, 0, 4);
        $month = substr($request->tanggal, 5, 2);
        if ($user->type === 'produksi') {
            $project = Project::whereMonth('tanggal_masuk', '=', $month)->whereYear('tanggal_masuk', '=', $dateYear)->where(function($query){
                $query->where('status', '=', 'Produksi')->orWhere('status', '=', 'Selesai')->orWhere('status', '=', 'Dikirim');
            })
            ->join('customers', 'customers.id', '=', 'projects.customer_id')
            ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
            ->select('projects.id', 'projects.nama_project', 'projects.customer_id', 'customers.nama AS namaCustomer',
            'projects.cat_project_id', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.satuan',
            'projects.size', 'projects.spec', 'projects.spec_cover', 'projects.finishing', 'projects.file',
            'projects.tanggal_masuk', 'projects.deadline', 'projects.tanggal_selesai', 'projects.tanggal_kirim',
            'projects.harga', 'projects.harga_modal', 'projects.pembayaran', 'projects.sisa_pembayaran',
            'projects.status')
            ->orderBy('projects.tanggal_masuk', 'desc')
            ->get();
        }else {
            $project = Project::whereMonth('tanggal_masuk', '=', $month)->whereYear('tanggal_masuk', '=', $dateYear)
            ->join('customers', 'customers.id', '=', 'projects.customer_id')
            ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
            ->select('projects.id', 'projects.nama_project', 'projects.customer_id', 'customers.nama AS namaCustomer',
            'projects.cat_project_id', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.satuan',
            'projects.size', 'projects.spec', 'projects.spec_cover', 'projects.finishing', 'projects.file',
            'projects.tanggal_masuk', 'projects.deadline', 'projects.tanggal_selesai', 'projects.tanggal_kirim',
            'projects.harga', 'projects.harga_modal', 'projects.pembayaran', 'projects.sisa_pembayaran',
            'projects.status')
            ->orderBy('projects.tanggal_masuk', 'desc')
            ->get();
        }

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
            'nama_project' => 'required|string|unique:projects',
            'customer_id' => 'required',
            'cat_project_id' => 'required',
            'qty' => 'required|numeric|min:1',
            'satuan' => 'required',
            'size' => 'required',
            'tanggal_masuk' => 'required',
            'harga' => 'nullable|numeric|min:0|not_in:0',
            'harga_modal' => 'nullable|numeric|min:0|not_in:0',
            'status' => 'required',
        ]);

        Project::create($request->all());
        return ['message' => "success"];
    }

    public function uploadPdf(Request $request)
    {
        $input = $request->all();
        $input['image'] = null;
        $uploadedFile = $request->pdf;
        // return response(['fileextension'=>$uploadedFile->extension()]);
        $filename = $request->nama.'-'.time().'.'.$uploadedFile->getClientOriginalExtension();
        $uploadedFile->move(public_path('/products/'), $filename);
        // if ($request->hasFile('image')){
        //     $input['image'] = '/upload/products/'.str_slug($input['nama'], '-').'.'.$request->image->getClientOriginalExtension();
        //     $request->image->move(public_path('/upload/products/'), $input['image']);
        // }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function show(Project $project)
    {
        //
        return $project;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function edit(Project $project)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Project $project)
    {
        //
        $this->validate($request, [
            'nama_project' => 'required|string|unique:projects,nama_project,'.$project->id,
            'customer_id' => 'required',
            'cat_project_id' => 'required',
            'qty' => 'required|numeric|min:1',
            'satuan' => 'required',
            'size' => 'required',
            'tanggal_masuk' => 'required',
            'harga' => 'nullable|numeric|min:0|not_in:0',
            'harga_modal' => 'nullable|numeric|min:0|not_in:0',
            'status' => 'required',
        ]);

        // $currentFile = $project->file;

        // if($request->file != $currentFile){

            // $name = time().'.' . explode('/', explode(':', substr($request->file('file'), 0, strpos($request->file('file'), ';')))[1])[1];
            // $name = 'asu';
            // $request->file->save(public_path('projects/').$name);
            // $request->file('file')->move(
            //     base_path() . '/public/files', $name
            // );
            // $request->merge(['file' => $name]);

            // $projectFile = public_path('files/').$currentFile;
            // if(file_exists($projectFile)){
            //     @unlink($projectFile);
            // }

        // }

        // $file = $request->file;
        //     $filename = time().'.' . explode('/', explode(':', substr($request->file[0], 0, strpos($request->file[0], ';')))[1])[1];
        // $request->file->move(public_path('projects'), $filename);

        $project->update($request->all());
        return ['message' => "success"];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Project  $project
     * @return \Illuminate\Http\Response
     */
    public function destroy(Project $project)
    {
        //
        $project->delete();
        return ['message' => 'Delete Success'];
    }

    public function projectDB()
    {
        // $words = explode(" ", "Community College District");
        // $acronym = "";

        // foreach ($words as $w) {
        //     $acronym .= $w[0];
        // }
        $user = auth('api')->user();
        $date = date("Y-m-d");
        $thismonth = substr($date, 5, 2);
        $thisyear = substr($date, 0, 4);

        if ($user->type == 'produksi') {
            $produksi = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Produksi')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();
            $selesai = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Selesai')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $dikirim = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Dikirim')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            return ['produksi'=>$produksi, 'selesai'=>$selesai, 'dikirim'=>$dikirim, ];
        } elseif ($user->type === 'admin') {
            $konsep = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Konsep')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $dikirim = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Dikirim')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $penawaran = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Penawaran')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $piutang = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.sisa_pembayaran', '>', '0')
                        ->where(function($query){
                            $query->where('status', '=', 'Disetujui')->orWhere('status', '=', 'Produksi')
                            ->orWhere('status', '=', 'Selesai')
                            ->orWhere('status', '=', 'Dikirim');
                        })
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            return ['penawaran'=>$penawaran, 'konsep'=>$konsep, 'dikirim'=>$dikirim, 'piutang'=>$piutang, ];
        } elseif ($user->type === 'sales') {
            $produksi = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Produksi')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();
            $selesai = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Selesai')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $dikirim = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Dikirim')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $penawaran = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Penawaran')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            return ['penawaran'=>$penawaran, 'selesai'=>$selesai, 'dikirim'=>$dikirim, 'produksi'=>$produksi, ];
        } elseif ($user->type === 'manager') {
            $konsep = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Konsep')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $selesai = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Selesai')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $dikirim = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Dikirim')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $disetujui = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.status', '=', 'Disetujui')
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $piutang = DB::table('projects')
                        ->join('customers', 'customers.id', '=', 'projects.customer_id')
                        ->join('cat_projects', 'cat_projects.id', '=', 'projects.cat_project_id')
                        ->select('projects.id', 'projects.nama_project', 'customers.nama AS namaCustomer', 'cat_projects.nama AS catProject', 'projects.qty', 'projects.deadline',
                        'projects.pembayaran', 'projects.sisa_pembayaran', 'projects.status')
                        ->where('projects.sisa_pembayaran', '>', '0')
                        ->where(function($query){
                            $query->where('status', '=', 'Disetujui')->orWhere('status', '=', 'Produksi')
                            ->orWhere('status', '=', 'Selesai')
                            ->orWhere('status', '=', 'Dikirim');
                        })
                        ->orderBy('tanggal_masuk', 'desc')
                        ->take(3)->get();

            $nilai = DB::table('projects')->where(function($query){
                            $query->where('status', '=', 'Disetujui')->orWhere('status', '=', 'Produksi')
                            ->orWhere('status', '=', 'Selesai')
                            ->orWhere('status', '=', 'Dikirim');
                        })->whereMonth('tanggal_masuk', '=', $thismonth)
                        ->whereYear('tanggal_masuk', '=', $thisyear)->get()->sum('harga');

            $keuntungan = DB::table('projects')->where(function($query){
                            $query->where('status', '=', 'Disetujui')->orWhere('status', '=', 'Produksi')
                            ->orWhere('status', '=', 'Selesai')
                            ->orWhere('status', '=', 'Dikirim');
                        })->whereMonth('tanggal_masuk', '=', $thismonth)
                        ->whereYear('tanggal_masuk', '=', $thisyear)->select(DB::raw('harga - harga_modal AS keuntungan'))->get()->sum('keuntungan');

            $totalpiutang = DB::table('projects')->where(function($query){
                            $query->where('status', '=', 'Disetujui')->orWhere('status', '=', 'Produksi')
                            ->orWhere('status', '=', 'Selesai')
                            ->orWhere('status', '=', 'Dikirim');
                        })->get()->sum('sisa_pembayaran');

            return ['konsep'=>$konsep, 'piutang'=>$piutang, 'disetujui'=>$disetujui, 'selesai'=>$selesai, 'dikirim'=>$dikirim, 'nilai'=>$nilai, 'keuntungan'=>$keuntungan, 'totalpiutang'=>$totalpiutang, ];
        }
    }
}
