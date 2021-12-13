<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
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
        $user = User::all();
        return $user;
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function userLogin()
    {
        // $user = Auth::user();
        $user = auth('api')->user();
        return $user;
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
            'name' => 'required|string|max:191',
            'email' => 'required|string|email|max:191|ends_with:trison.com|unique:users',
            'password' => 'required|string|min:6|confirmed',
            'type' => 'sometimes|string',
        ]);

        $foto = 'avatar.png';

        if(empty($request->photo)){
            $request->merge(['photo' => $foto ]);
        }

        User::create($request->has('password') ? array_merge($request->except('password'), ['password' => bcrypt($request->input('password'))]) : $request->except('password'));
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
        //
        return $user;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, User $user)
    {
        //
        $this->validate($request, [
            'name' => 'required|string|max:191',
            'email' => 'required|string|email|max:191|ends_with:trison.com|unique:users,email,'.$user->id,
            'password' => 'sometimes|min:6|confirmed',
            'type' => 'sometimes',
        ]);

        $user->update($request->has('password') ? array_merge($request->except('password'), ['password' => bcrypt($request->input('password'))]) : $request->except('password'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        //
        $user->delete();
        return ['message' => 'Delete Success'];
    }

    public function saveSetting(Request $request)
    {
        // $user = Auth::user();
        $user = auth('api')->user();

        $this->validate($request, [
            'name' => 'required|string|max:191',
            'email' => 'required|string|email|max:191|ends_with:trison.com|unique:users,email,'.$user->id,
            'password' => 'sometimes|required|min:6|confirmed',
            'type' => 'sometimes',
        ]);

        if(!empty($request->password)){
            $request->merge(['password' => Hash::make($request ['password'])]);
        }

        $user->update($request->all());
        return ['message' => "success"];

    }

    public function userDB()
    {
        $user = DB::table('users')->count();
        return $user;
    }
}
