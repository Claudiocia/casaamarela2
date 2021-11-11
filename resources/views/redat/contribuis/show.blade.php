@extends('layouts.casaamarela')

@section('conteudo')
<div class="p-6 sm:px-20 bg-white border-b border-gray-200" style="margin: 50px;">
    <div id="admin-content">
        <div class="container-admin">
            <div class="row" >
                <div class="col-md-12">
                    <div class="w-auto p-3">
                        <div class="panel-heading-admin">
                            <h5>Mensagem de contribuição com o tema {{$contribui->tema}}</h5>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset" style="margin-bottom: 25px;">
                                {!! Button::primary('Voltar')->asLinkTo(route('redat.contribuis.index')) !!}
                                {!! Button::danger('Delete')
                                        ->asLinkTo(route('redat.contribuis.destroy', ['contribui' => $contribui->id]))
                                        ->addAttributes(['onclick' => 'event.preventDefault();document.getElementById("form-delete").submit();'])
                             !!}
                                <?php $formDelete = FormBuilder::plain([
                                    'id' => 'form-delete',
                                    'route' => ['redat.contribuis.destroy', 'contribui' => $contribui->id],
                                    'method' => 'DELETE',
                                    'style' => 'display:none',
                                ]); ?>
                                {!! form($formDelete) !!}
                            </div>
                            <div class="row">
                                <div id="register-show">
                                    <div class="row bloco-div-show desk">
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Tema</h6>
                                            <div class="quem-show">
                                                {!! $contribui->tema !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Proposição</h6>
                                            <div class="quem-show">
                                                {!! $contribui->contribui !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">E-mail</h6>
                                            <div class="quem-show">
                                                {!! $contribui->email !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Telefone</h6>
                                            <div class="quem-show">
                                                {!! $contribui->phone !!}
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="block font-medium text-sm text-gray-700 label-show">Autor da proposta</h6>
                                        <div class="quem-show">
                                            @if($contribui->user_id == null)
                                                Não está cadastrado em nosso sistema
                                            @else
                                                Está cadastrado no sistema
                                            @endif
                                        </div>
                                    </div>
                                    <div>
                                        <h6 class="block font-medium text-sm text-gray-700 label-show">
                                            Caso seja necessário use o botão abaixo para informar no sistema o status da sugestão!
                                        </h6>
                                        <div class="btn-aprov">
                                            @if($contribui->aprov == 's')
                                                <a class="btn btn-primary my-button" href="{{route('redat.contribuis.edit', ['contribui' => $contribui->id ])}}">Sugestão Aproveitada</a>
                                                <h6 class="text-aprov">  Esta sugestão JÁ foi aproveitada</h6>
                                            @else
                                                <a class="btn btn-danger my-button" href="{{route('redat.contribuis.edit', ['contribui' => $contribui->id ])}}">Sugestão Não Aproveitada</a>
                                                <h6 class="text-n-aprov">  Esta sugestão ainda NÃO foi aproveitada</h6>
                                            @endif
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
