<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Taches;
use Illuminate\Http\Request;

class TachesController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $taches = Taches::all();
        return $taches;
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $tache = Taches::create($request->all());
        return $tache;
    }

    /**
     * Display the specified resource.
     */
    public function show(Taches $taches)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Taches $taches)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Taches $taches)
    {
        $taches = Taches::findOrFail($taches->id);
        $taches ->update([
            'titre' => $request->titre,
            'description' => $request->titre,
        ]);

        return $taches;
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        return Taches::destroy($id);
    }
}
