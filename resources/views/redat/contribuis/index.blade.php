@extends('layouts.casaamarela')

@section('conteudo')
<div class="p-6 sm:px-20 bg-white border-b border-gray-200">
    <div id="admin-content" style="margin-top: 80px;">
        <div class="container-admin">
            <div class="row">
                <div class="col-md-12">
                    <div class="w-auto p-3">
                        <div class="panel-heading-admin">
                            <h5>Lista de contribuição</h5>
                            <div class="form-search">
                                <form action="{{ route('redat.contribuis.index') }}" method="get">
                                    <label class="label-search">Filtro</label>
                                    <select class="form-control" name="filtro">
                                        <option value="">Selecione o filtro...</option>
                                        <option>Graduação</option>
                                        <option>Pós-Graduação</option>
                                        <option>EAD</option>
                                        <option>Extensão</option>
                                        <option>Pesquisa e Inovação</option>
                                        <option>Internacionalização</option>
                                        <option>Gestão e Organização</option>
                                        <option>Gestão de Pessoas</option>
                                        <option>Infraestrutura</option>
                                        <option>Planejamento e Avaliação Institucional</option>
                                        <option>Assistência Estudantil</option>
                                        <option>Resp. Social e Ações Afirmativas</option>
                                        <option>Comunicação e Cultura</option>
                                        <option>Tecnologia e Conectividade</option>
                                    </select>
                                    <label class="label-search">Pesquisar</label>
                                    <x-jet-input id="search" class="mt-1 w-full" type="search" name="search"/>
                                    <div class="buton-search">
                                    <x-jet-button class="ml-4 buton-sch">
                                         {{ __('Pesquisar') }}
                                    </x-jet-button>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset">
                                {!! Button::primary('Limpar')->asLinkTo(route('redat.contribuis.index')) !!}
                            </div>
                            <div class="row" style="margin-left: 10px; margin-right: 10px;">
                                {!!
                                    Table::withContents($contribuis)->striped()
                                    ->callback('Actions', function ($field, $contribui){
                                        $linkShow = route('redat.contribuis.show', ['contribui' => $contribui->id]);
                                        return \Bootstrapper\Facades\Button::LINK('<i class="fas fa-eye"></i>')->asLinkTo($linkShow);
                                    })
                                !!}
                            </div>
                        </div>
                        </div>
                    {{ $contribuis->links() }}

                </div>
            </div>
        </div>


    </div>
</div>
@endsection
