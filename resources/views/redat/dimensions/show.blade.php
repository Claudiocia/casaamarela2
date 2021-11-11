@extends('layouts.casaamarela')

@section('conteudo')
<div class="p-6 sm:px-20 bg-white border-b border-gray-200">
    <div id="admin-content">
        <div class="container-admin">
            <div class="row">
                <div class="col-md-12">
                    <div class="w-auto p-3">
                        <div class="panel-heading-admin">
                            <h5>Dimensão {{ $dimension->name }}</h5>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset">
                                {!! Button::primary('Voltar')->asLinkTo(route('redat.dimensions.index')) !!}
                                {!! Button::primary('Editar')->asLinkTo(route('redat.dimensions.edit', ['dimension' => $dimension->id])) !!}
                            </div>
                            <div class="row" style="margin-top: 10px;">
                                <div id="register-show">
                                    <div class="row bloco-div-show desk">
                                        <div class="nome">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Nome</h6>
                                            <div class="texto-show">
                                                {{ $dimension->name }}
                                            </div>
                                        </div>
                                        <div class="nome">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Sigla</h6>
                                            <div class="texto-show">
                                                {{ $dimension->sigla }}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Introdução</h6>
                                            <div class="quem-show">
                                                {!! $dimension->introd !!}
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
