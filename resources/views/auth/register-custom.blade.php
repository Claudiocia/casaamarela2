@extends('layouts.casaamarela')

@section('conteudo')
    <section id="cadastro">
    <div class="p-6 sm:px-20 bg-white border-b border-gray-200">
        <div class="mt-6 text-gray-500" style="display: flex; justify-content: center;">
            <div class="logocasa">
                <img src="{{asset('site/img/logo_pluri_round.png')}}" alt="" width="100px"/>
            </div>
        </div>
        <div id="admin-content">
            <div class="container-admin">
                <div class="row">
                    <div class="col-md-12">
                        <div class="w-auto p-3">
                            <div class="panel-heading-admin">
                                <h5>Novo cadastro</h5>
                            </div>
                        </div>
                        <div class="panel-body">
                            <x-jet-validation-errors class="mb-4" />
                            <div class="form-admin">
                                <?php $icon = '<i class="fas fa-save"></i>'; ?>
                                {!!
                                        form($form->add('salvar', 'submit', [
                                            'attr' => ['class' => 'btn btn-primary btn-block', 'style' => 'width:120px; margin-top:10px;'],
                                            'label' => $icon.' Salvar'
                                         ]))
                                 !!}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
