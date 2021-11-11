@extends('layouts.casaamarela')

@section('conteudo')
<div class="p-6 sm:px-20 bg-white border-b border-gray-200">
    <div id="admin-content" style="margin-top: 80px;">
        <div class="container-admin">
            <div class="row">
                <div class="col-md-12">
                    <div class="w-auto p-3">
                        <div class="panel-heading-admin">
                            <h5>Lista de Artigos</h5>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset">
                                {!! Button::primary('Novo')->asLinkTo(route('admin.posts.create')) !!}
                                {!! Button::primary('Limpar')->asLinkTo(route('admin.posts.index')) !!}
                            </div>
                            <div class="row" style="margin-left: 10px; margin-right: 10px;">
                                {!!
                                    Table::withContents($posts)->striped()
                                    ->callback('Detalhes', function ($field, $post){
                                        if($post->foto_nome == null){
                                            return MediaObject::withContents([
                                                'image' => asset('site/img/sem_foto_thumb2.png'),
                                                'link' => route('admin.posts.uploadFoto', ['post' => $post->id]),
                                                'heading' => substr($post->titulo, 0, 80),
                                                'body' => Carbon\Carbon::parse($post->data)->format('d/m/Y').'<br/>'.$post->resumo,
                                            ]);
                                        }else{
                                            return MediaObject::withContents([
                                                'image' => asset('site/img/thumbnail/'.$post->foto_nome),
                                                'link' => route('admin.posts.uploadFoto', ['post' => $post->id]),
                                                'heading' => substr($post->titulo, 0, 80),
                                                'body' => Carbon\Carbon::parse($post->data)->format('d/m/Y').'<br/>'.$post->resumo,
                                            ]);
                                        }
                                    })
                                    ->callback('Ações', function ($field, $post){
                                        $linkEdit = route('admin.posts.edit', ['post' => $post->id]);
                                        $linkShow = route('admin.posts.show', ['post' => $post->id]);
                                        return \Bootstrapper\Facades\Button::LINK('<i class="fas fa-pencil-alt"></i>')->asLinkTo($linkEdit)." | ".
                                        \Bootstrapper\Facades\Button::LINK('<i class="fas fa-eye" ></i>')->asLinkTo($linkShow);
                                    })
                                !!}
                            </div>
                        </div>
                        </div>
                    {{ $posts->links() }}

                </div>
            </div>
        </div>


    </div>
</div>
@endsection

