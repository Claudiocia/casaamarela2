@extends('layouts.casaamarela')

@section('conteudo')
<div class="p-6 sm:px-20 bg-white border-b border-gray-200" style="margin-top: 80px;">
    <div id="admin-content">
        <div class="container-admin">
            <div class="row">
                <div class="col-md-12">
                    <div class="w-auto p-3">
                        <div class="panel-heading-admin">
                            <h5>Prévia do Artigo</h5>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset" style="margin-bottom: 15px;">
                                {!! Button::primary('Voltar')->asLinkTo(route('admin.posts.index')) !!}
                                {!! Button::primary('Editar')->asLinkTo(route('admin.posts.edit', ['post' => $post->id])) !!}
                                {!! Button::danger('Delete')
                                        ->asLinkTo(route('admin.posts.destroy', ['post' => $post->id]))
                                        ->addAttributes(['onclick' => 'event.preventDefault();document.getElementById("form-delete").submit();'])
                             !!}
                                <?php $formDelete = FormBuilder::plain([
                                    'id' => 'form-delete',
                                    'route' => ['admin.posts.destroy', 'post' => $post->id],
                                    'method' => 'DELETE',
                                    'style' => 'display:none',
                                ]); ?>
                                {!! form($formDelete) !!}
                            </div>
                            <section id="blog" class="blog">
                                <div class="container" data-aos="fade-up">
                                    <div class="row">
                                        <div class="col-lg-12 entries">
                                            <article class="entry entry-single">
                                                <div class="entry-img">
                                                    <img src="{{asset($post->foto_path)}}" alt="" class="img-fluid">
                                                </div>

                                                <h2 class="entry-title">
                                                    <a href="">{{$post->titulo}}</a>
                                                </h2>

                                                <div class="entry-meta">
                                                    <ul>
                                                        <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a>{{$post->user->name}}</a></li>
                                                        <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a>{{Carbon\Carbon::parse($post->data)->format('d/m/Y')}}</a></li>
                                                        <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a>{{$commentsCount}} Comentários</a></li>
                                                        <li class="d-flex align-items-center"><i class="bi bi-hand-thumbs-up"></i><a>({{$post->positivo}})</a></li>
                                                        <li class="d-flex align-items-center"><i class="bi bi-hand-thumbs-down"></i><a>({{$post->negativo}})</a></li>
                                                    </ul>
                                                </div>
                                                <div class="entry-content">

                                                    <blockquote>
                                                        <p>
                                                            {!! $post->resumo !!}
                                                        </p>
                                                    </blockquote>

                                                    {!! $post->texto !!}

                                                </div>

                                                <div class="entry-footer">
                                                    <i class="bi bi-folder"></i>
                                                    <ul class="cats">
                                                        <li><a>Categoria: {{$post->categoria->nome}}</a></li>
                                                    </ul>

                                                    <i class="bi bi-tags"></i>Tags:
                                                    <ul class="tags">
                                                        @foreach($post->tags as $tag)
                                                            <li><a>{{$tag->nome}}</a></li>
                                                        @endforeach
                                                    </ul>
                                                </div>

                                            </article><!-- End blog entry -->

                                            <div class="blog-author d-flex align-items-center">

                                                <div>
                                                    <h4>{{$post->user->name}}</h4>
                                                </div>
                                            </div><!-- End blog author bio -->

                                            <div class="blog-comments">

                                                <h4 class="comments-count">{{$commentsCount}} Comments</h4>

                                                @if($commentsCount > 0)
                                                    @foreach($comments as $comment)
                                                        <div id="comment-{{$comment->id}}" class="comment">
                                                            <div class="d-flex">
                                                                <div>
                                                                    <h5>Comentado por: {{$comment->nome.' '}} / Status: {{$comment->publica == 's'? 'Publicado' : 'Não publicado'}}</h5>
                                                                    <div class="avalia">
                                                                        <h5 class="reply"><i class="bi bi-hand-thumbs-up-fill"></i>Gostei ({{$comment->positivo}})</h5>
                                                                        <h5 class="reply"><i class="bi bi-hand-thumbs-down-fill"></i>Não gostei({{$comment->negativo}})</h5>
                                                                    </div>
                                                                    <time datetime="2020-01-01">{{\Carbon\Carbon::parse($comment->data)->format('d/m/Y')}}</time>
                                                                    {{$comment->comentario}}
                                                                </div>
                                                                <div>
                                                                    @if($comment->publica == 's')
                                                                    <form action="{{route('comments.update',['comment' => $comment->id])}}" enctype="multipart/form-data" method="post">
                                                                        @csrf
                                                                        @method('PUT')
                                                                        <input type="hidden" name="action" value="n">
                                                                        <input type="hidden" name="id" value="{{$comment->id}}">
                                                                        <h5 class="reply"><button type="submit" class="reply"><i class="bi bi-journal-minus"></i> Alterar status</button></h5>
                                                                    </form>
                                                                    @else
                                                                        <form action="{{route('comments.update',['comment' => $comment->id])}}" enctype="multipart/form-data" method="post">
                                                                            @csrf
                                                                            @method('PUT')
                                                                            <input type="hidden" name="action" value="s">
                                                                            <input type="hidden" name="id" value="{{$comment->id}}">
                                                                            <h5 class="reply"><button type="submit" class="reply"><i class="bi bi-journal-plus"></i> Alterar status</button></h5>
                                                                        </form>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                        </div><!-- End comment -->
                                                    @endforeach
                                                @endif
                                            </div><!-- End blog comments -->
                                        </div><!-- End blog entries list -->
                                    </div>
                                </div>
                            </section><!-- End Blog Single Section -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
