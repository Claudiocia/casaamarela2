<?php

namespace App\Http\Controllers;

use App\Forms\DimensionForm;
use App\Models\Dimension;
use App\Models\Eixo;
use Illuminate\Http\Request;

class DimensionsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('redat.dimensions.index');
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
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Dimension  $dimension
     * @return \Illuminate\Http\Response
     */
    public function show(Dimension $dimension)
    {
        return view('redat.dimensions.show', compact('dimension'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Dimension  $dimension
     * @return \Illuminate\Http\Response
     */
    public function edit(Dimension $dimension)
    {
        $form = \FormBuilder::create(DimensionForm::class, [
            'url' => route('redat.dimensions.update', [ 'dimension' => $dimension->id]),
            'method' => 'PUT',
            'model' => $dimension,
            'data' => ['id' => $dimension->id],
        ]);

        return view('redat.dimensions.edit', compact('form'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Dimension  $dimension
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Dimension $dimension)
    {
        $data = $request->all();
        $dimension->fill($data);
        $dimension->save();

        $request->session()->flash('msg', 'Dimensão atualizada com sucesso!');
        return redirect()->route('redat.dimensions.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Dimension  $dimension
     * @return \Illuminate\Http\Response
     */
    public function destroy(Dimension $dimension)
    {
        //
    }
}
