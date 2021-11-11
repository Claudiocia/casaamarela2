@extends('layouts.casaamarela')

@section('conteudo')
<div class="p-6 sm:px-20 bg-white border-b border-gray-200">
    <div id="admin-content">
        <div class="container-admin">
            <div class="row">
                <div class="col-md-12">
                    <div class="w-auto p-3">
                        <div class="panel-heading-admin">
                            <h5>Editar Dimensão</h5>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset">
                                {!! Button::primary('Voltar')->asLinkTo(route('redat.dimensions.index')) !!}
                            </div>
                            <div class="form-admin">
                                <?php $icon = '<i class="fas fa-save"></i>'; ?>
                                {!!
                                    form($form->add('salvar', 'submit', [
                                        'attr' => ['class' => 'btn btn-primary btn-block', 'style' => 'width:120px; margin-top:20px;'],
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
</div>
@endsection
