<?php

namespace App\Http\Controllers\API;

use App\CatProject;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CatProjectController extends Controller
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
        $catProject = CatProject::all();
        return $catProject;
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
            'nama' => 'required|string|max:191|unique:cat_projects',
        ]);

        CatProject::create($request->all());
        return ['message' => "success"];
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\CatProject  $catProject
     * @return \Illuminate\Http\Response
     */
    public function show(CatProject $catProject)
    {
        //
        return $catProject;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\CatProject  $catProject
     * @return \Illuminate\Http\Response
     */
    public function edit(CatProject $catProject)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\CatProject  $catProject
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CatProject $catProject)
    {
        //
        $this->validate($request, [
            'nama' => 'required|string|max:191|unique:cat_projects,nama,'.$request->id,
        ]);

        $catProject = CatProject::findOrFail($request->id);
        $catProject->update($request->all());
        return ['message' => "success"];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\CatProject  $catProject
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        $catProject = CatProject::findOrFail($id);
        $catProject->delete();
        return ['message' => 'Delete Success'];
    }
}
