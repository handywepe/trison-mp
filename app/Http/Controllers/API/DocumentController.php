<?php

namespace App\Http\Controllers\API;

use App\Document;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DocumentController extends Controller
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
        // $request['doc'] = $request->doc;
        // $request['file'] = $request->file;

        $this->validate($request, [
            'file' => 'required',
            'doc' => 'required',
        ]);


        // $uploadedFile =  $request['file'];
        $uploadedFile =  $request->file;
        $filename =  $request->doc.'-'.date("dmY").'.'.$uploadedFile->getClientOriginalExtension();
        $uploadedFile->move(public_path('/projects/'), $filename);
        // Document::create($request->all());

        Document::create([
            // 'project_id' => $request['project_id'],
            'project_id' => $request->project_id,
            'doc' => $filename,
        ]);
        return ['message' => "success"];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Document  $document
     * @return \Illuminate\Http\Response
     */
    public function showByProject(Request $request)
    {
        //
        $project = $request->project_id;
        $document = DB::table('documents')
        ->where('project_id', '=', $project )
        ->orderBy('created_at', 'desc')
        ->get();

        return $document;
        // return $project;
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Document  $document
     * @return \Illuminate\Http\Response
     */
    public function show(Document $document)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Document  $document
     * @return \Illuminate\Http\Response
     */
    public function edit(Document $document)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Document  $document
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Document $document)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Document  $document
     * @return \Illuminate\Http\Response
     */
    public function destroy(Document $document)
    {
        //
        $currentDoc = $document->doc;
        $doc = public_path('projects/').$currentDoc;
            if(file_exists($doc)){
                @unlink($doc);
            }
        $document->delete();
        return ['message' => 'Delete Success'];
        // return $doc;
    }
}
