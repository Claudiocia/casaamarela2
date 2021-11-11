@extends('layouts.casaamarela')

@section('conteudo')
<div class="p-6 sm:px-20 bg-white border-b border-gray-200" style="margin-top: 80px;">
    <div id="admin-content">
        <div class="container-admin">
            <div class="row">
                <div class="col-md-12">
                    <div class="w-auto p-3">
                        <div class="panel-heading-admin">
                            <h5>Dimensão {{ $eixo->dimension->name }} - Eixo {{$eixo->name}}</h5>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset">
                                {!! Button::primary('Voltar')->asLinkTo(route('redat.dimensions.index')) !!}
                                {!! Button::primary('Editar')->asLinkTo(route('redat.eixos.edit', ['eixo' => $eixo->id])) !!}
                            </div>
                            <div class="row" style="margin-top: 20px;">
                                <div id="register-show">
                                    <div class="row bloco-div-show desk">
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Descrição</h6>
                                            <div class="quem-show">
                                                {!! $eixo->descr !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Forças / Potencialidades</h6>
                                            <div class="quem-show">
                                                {!! $eixo->forca !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Fraquezas / Fragilidades</h6>
                                            <div class="quem-show">
                                                {!! $eixo->fraqu !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Oportunidades</h6>
                                            <div class="quem-show">
                                                {!! $eixo->oport !!}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row bloco-div-show desk">
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Ameaças</h6>
                                            <div class="quem-show">
                                                {!! $eixo->ameac !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Última Edição</h6>
                                            <div class="quem-show">
                                                {{ \Carbon\Carbon::parse($eixo->altera)->format('d/m/Y').' - Autor: '.$eixo->user->name }}
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
