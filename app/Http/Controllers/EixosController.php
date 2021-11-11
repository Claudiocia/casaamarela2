<?php

namespace App\Http\Controllers;

use App\Forms\EixosForm;
use App\Models\Eixo;
use Illuminate\Http\Request;
use Kris\LaravelFormBuilder\Form;

class EixosController extends Controller
{
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
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Eixo  $eixo
     * @return \Illuminate\Http\Response
     */
    public function show(Eixo $eixo)
    {
        return view('redat.eixos.show', compact('eixo'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Eixo  $eixo
     * @return \Illuminate\Http\Response
     */
    public function edit(Eixo $eixo)
    {
        $form = \FormBuilder::create(EixosForm::class, [
            'url' => route('redat.eixos.update', ['eixo' => $eixo->id]),
            'method' => 'PUT',
            'model' => $eixo,
            'data' => ['id' => $eixo->id],
        ]);

        return view('redat.eixos.edit', compact('form', 'eixo'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Eixo  $eixo
     * @return \Illuminate\Http\RedirectResponse|\Illuminate\Http\Response
     */
    public function update(Request $request, Eixo $eixo)
    {
        /** @var Form $form */
        $form = \FormBuilder::create(EixosForm::class);

        if (!$form->isValid()){
            return redirect()
                ->back()
                ->withErrors($form->getErrors())
                ->withInput();
        }
        $data = $form->getFieldValues();
        $eixo->fill($data);
        $eixo->save();

        $request->session()->flash('msg', 'Eixo '.$eixo->name.' da dimensão '.$eixo->dimension->name.' atualizado com sucesso!');
        return redirect()->route('redat.dimensions.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Eixo  $eixo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Eixo $eixo)
    {
        //
    }
}
