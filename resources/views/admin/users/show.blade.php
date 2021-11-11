@extends('layouts.casaamarela')

@section('conteudo')
<div class="p-6 sm:px-20 bg-white border-b border-gray-200" style="margin-top: 80px;">
    <div id="admin-content">
        <div class="container-admin">
            <div class="row">
                <div class="col-md-12">
                    <div class="w-auto p-3">
                        <div class="panel-heading-admin">
                            <h5>Perfil do usuário {{ $user->name }}</h5>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset" style="margin-bottom: 15px;">
                                {!! Button::primary('Voltar')->asLinkTo(route('admin.users.index')) !!}
                                {!! Button::primary('Editar')->asLinkTo(route('admin.users.edit', ['user' => $user->id])) !!}
                                {!! Button::danger('Delete')
                                        ->asLinkTo(route('admin.users.destroy', ['user' => $user->id]))
                                        ->addAttributes(['onclick' => 'event.preventDefault();document.getElementById("form-delete").submit();'])
                             !!}
                                <?php $formDelete = FormBuilder::plain([
                                    'id' => 'form-delete',
                                    'route' => ['admin.users.destroy', 'user' => $user->id],
                                    'method' => 'DELETE',
                                    'style' => 'display:none',
                                ]); ?>
                                {!! form($formDelete) !!}
                            </div>
                            <div class="row">
                                <div id="register-show">
                                    <div class="row bloco-div-show desk">
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Nome</h6>
                                            <div class="quem-show">
                                                {!! $user->name !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">E-mail</h6>
                                            <div class="quem-show">
                                                {!! $user->email." - " !!} {{ $user->autoriz == 's'? 'Autoriza envio de e-mail' : 'Não autoriza envio de e-mail' }}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Nome Social</h6>
                                            <div class="quem-show">
                                                {!! $user->nome_social !!}
                                            </div>
                                        </div>
                                        <div class="nome">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Telefone</h6>
                                            <div class="texto-show">
                                                {{ $user->celular }}
                                            </div>
                                        </div>
                                        <div class="nome">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Matrícula</h6>
                                            <div class="texto-show">
                                                {{ $user->matricula }}
                                            </div>
                                        </div>
                                        <div class="nome">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Identidade de Genero</h6>
                                            <div class="texto-show">
                                                @switch($user->genero)
                                                    @case('m')
                                                    Masculino
                                                    @break
                                                    @case('f')
                                                    Feminino
                                                    @break
                                                    @case('nb')
                                                    Não Binário
                                                    @break
                                                    @case('htg')
                                                    Homem Transgênero
                                                    @break
                                                    @case('mtg')
                                                    Mulher Transgênero
                                                    @break
                                                    @case('hts')
                                                    Homem Transexual
                                                    @break
                                                    @case('mts')
                                                    Mulher Transexual
                                                    @break
                                                    @case('cis')
                                                    Cisgênero
                                                    @break
                                                    @case('nsr')
                                                    Não sei responder
                                                    @break
                                                    @case('pnr')
                                                    Prefiro não responder
                                                    @break
                                                    @case('out')
                                                    Outros
                                                    @break
                                                @endswitch
                                            </div>
                                        </div>
                                        <div class="nome">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Identidade Racial</h6>
                                            <div class="texto-show">
                                                @switch($user->raca)
                                                    @case('afd')
                                                    Afro-Descendente
                                                    @break
                                                    @case('ind')
                                                    Indigena
                                                    @break
                                                    @case('amare')
                                                    Amarelo
                                                    @break
                                                    @case('ngr')
                                                    Negro
                                                    @break
                                                    @case('brc')
                                                    Branco
                                                    @break
                                                    @case('prt')
                                                    Preto
                                                    @break
                                                    @case('prd')
                                                    Pardo
                                                    @break
                                                    @case('nsr')
                                                    Não sei responder
                                                    @break
                                                    @case('prn')
                                                    Prefiro não responder
                                                    @break
                                                    @case('out')
                                                    Outros
                                                    @break
                                                @endswitch
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row bloco-div-show desk">
                                        <div class="nome dt-nasc">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Segmento</h6>
                                            <div class="texto-show">
                                                @switch($user->tipo)
                                                    @case('a')
                                                    Discente
                                                    @break
                                                    @case('t')
                                                    Técnico
                                                    @break
                                                    @case('p')
                                                    Docente
                                                    @break
                                                @endswitch
                                            </div>
                                        </div>
                                        <div class="nome dt-nasc">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Status</h6>
                                            <div class="texto-show">
                                                @switch($user->role)
                                                    @case(1)
                                                    Administrador
                                                    @break
                                                    @case(2)
                                                    Staff
                                                    @break
                                                    @case(3)
                                                    Redator
                                                    @break
                                                    @case(4)
                                                    Cadastrado
                                                    @break
                                                @endswitch
                                            </div>
                                        </div>
                                        <hr/>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Campus / Depart</h6>
                                            <div class="quem-show">
                                                {!! $user->campus->nome." / ".$user->departamento->nome." - ".$user->departamento->sigla !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Município</h6>
                                            <div class="quem-show">
                                                {!! $user->municipio->nome !!}
                                            </div>
                                        </div>
                                        <div>
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Curso</h6>
                                            <div class="quem-show">
                                                @if($user->curso_id == null)
                                                    Sem curso
                                                @else
                                                {{ $user->curso->nome }}
                                                @endif
                                            </div>
                                        </div>
                                        <div class="nome dt-nasc">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Modalidade</h6>
                                            <div class="texto-show">
                                                @if($user->mod_curso == 'pres')
                                                    Presencial
                                                @elseif($user->mod_curso == 'ead')
                                                    EAD
                                                @endif
                                            </div>
                                        </div>
                                        <div class="nome dt-nasc">
                                            <h6 class="block font-medium text-sm text-gray-700 label-show">Tipo</h6>
                                            <div class="texto-show">
                                                @switch($user->tipo_curso)
                                                    @case('bach')
                                                    Bacharelado
                                                    @break
                                                    @case('tec')
                                                    Tecnólogo
                                                    @break
                                                    @case('lic')
                                                    Licenciatura
                                                    @break
                                                    @case('pos')
                                                    Pós-Graduação
                                                    @break
                                                @endswitch
                                            </div>
                                        </div>
                                    </div>
                                    <hr/>
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
