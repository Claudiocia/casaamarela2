@extends('layouts.casaamarela')

@section('conteudo')

    <main id="main">

        <!-- ======= Breadcrumbs ======= -->
        <section class="breadcrumbs">
            <div class="container">

                <ol>
                    <li><a href="{{route('blog')}}?cat=&tag=">Todos os artigos</a></li>
                </ol>
                <h2>Artigo</h2>

            </div>
        </section><!-- End Breadcrumbs -->

        <!-- ======= Blog Single Section ======= -->
        <section id="blog" class="blog">
            <div class="container" data-aos="fade-up">

                <div class="row">

                    <div class="col-lg-8 entries">

                        <article class="entry entry-single">

                            <div class="entry-img">
                                <img src="{{asset($post->foto_path)}}" alt="" class="img-fluid">
                            </div>

                            <h2 class="entry-title">
                                <a href="">{{$post->titulo}}</a>
                            </h2>

                            <div class="entry-meta">
                                <ul>
                                    <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="#">{{$post->user->name}}</a></li>
                                    <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="#">{{Carbon\Carbon::parse($post->data)->format('d/m/Y')}}</a></li>
                                    <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="#">{{$commentsCount}} Comentários</a></li>
                                    <li class="d-flex align-items-center">
                                        <form action="{{route('posts.like',['post' => $post->id])}}" enctype="multipart/form-data" method="post">
                                            @csrf
                                            @method('PUT')
                                            <input type="hidden" name="action" value="positivo">
                                            <input type="hidden" name="id" value="{{$post->id}}">
                                            <button type="submit"><i class="bi bi-hand-thumbs-up">({{$post->positivo}})</i></button>
                                        </form>
                                    </li>
                                    <li class="d-flex align-items-center">
                                        <form action="{{route('posts.like',['post' => $post->id])}}" enctype="multipart/form-data" method="post">
                                            @csrf
                                            @method('PUT')
                                            <input type="hidden" name="action" value="negativo">
                                            <input type="hidden" name="id" value="{{$post->id}}">
                                            <button type="submit"><i class="bi bi-hand-thumbs-down">({{$post->negativo}})</i></button>
                                        </form>
                                    </li>
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
                                    <li><a href="#">{{$post->categoria->nome}}</a></li>
                                </ul>

                                <i class="bi bi-tags"></i>
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
                                                <h5>Comentado por: {{$comment->nome.' '}}</h5>
                                                <div class="avalia">
                                                    <form action="{{route('comments.update',['comment' => $comment->id])}}" enctype="multipart/form-data" method="post">
                                                        @csrf
                                                        @method('PUT')
                                                        <input type="hidden" name="action" value="positivo">
                                                        <input type="hidden" name="id" value="{{$comment->id}}">
                                                        <h5 class="reply"><button type="submit" class="reply"><i class="bi bi-hand-thumbs-up-fill"></i>Gostei</button></h5>
                                                    </form>
                                                    <form action="{{route('comments.update',['comment' => $comment->id])}}" enctype="multipart/form-data" method="post">
                                                        @csrf
                                                        @method('PUT')
                                                        <input type="hidden" name="action" value="negativo">
                                                        <input type="hidden" name="id" value="{{$comment->id}}">
                                                        <h5 class="reply">({{$comment->positivo}})<button type="submit" class="reply"><i class="bi bi-hand-thumbs-down-fill"></i>Não gostei</button>({{$comment->negativo}})</h5>
                                                    </form>
                                                </div>
                                                <time datetime="2020-01-01">{{\Carbon\Carbon::parse($comment->data)->format('d/m/Y')}}</time>
                                                {{$comment->comentario}}
                                            </div>
                                        </div>
                                    </div><!-- End comment -->
                                @endforeach
                            @endif

                            <div class="reply-form">
                                <h4>Comente sobre o artigo</h4>
                                <p>Seu e-mail não será publicado. Os campos marcados com (*) são obrigatórios</p>
                                <form action="{{route('comments.store')}}" enctype="multipart/form-data" method="POST">
                                    @csrf
                                    <div class="row">
                                        <div class="col-md-6 form-group">
                                            <input name="nome" type="text" class="form-control" placeholder="Seu Nome*" required>
                                        </div>
                                        <div class="col-md-6 form-group">
                                            <input name="email" type="text" class="form-control" placeholder="Seu Email*" required>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col form-group">
                                            <input name="post_id" type="hidden" class="form-control" value="{{$post->id}}">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col form-group">
                                            <textarea name="comentario" class="form-control" placeholder="Seu Comentario*" maxlength="500"></textarea>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Enviar</button>

                                </form>

                            </div>

                        </div><!-- End blog comments -->

                    </div><!-- End blog entries list -->

                    <div class="col-lg-4">

                        <div class="sidebar">

                            <h3 class="sidebar-title">Busca</h3>
                            <div class="sidebar-item search-form">
                                <form action="{{route('blog')}}">
                                    @csrf
                                    <input type="text" name="search">
                                    <input type="hidden" name="cat" value="">
                                    <input type="hidden" name="tag" value="">
                                    <button type="submit"><i class="bi bi-search"></i></button>
                                </form>
                            </div><!-- End sidebar search formn-->

                            <h3 class="sidebar-title">Categorias</h3>
                            <div class="sidebar-item categories">
                                <ul>
                                    @foreach($categories as $category)
                                        <?php $count = \App\Models\Post::where('categoria_id', '=', $category->id)->count(); ?>
                                        <li><a href="{{route('blog')}}?cat={{$category->id}}&tag=">{{$category->nome}}<span>({{$count}})</span></a></li>
                                    @endforeach
                                </ul>
                            </div><!-- End sidebar categories-->

                            <h3 class="sidebar-title">Artigos Recentes</h3>
                            <div class="sidebar-item recent-posts">
                                @foreach($posts as $post)
                                    <div class="post-item clearfix">
                                        <img src="{{asset('site/img/thumbnail/'.$post->foto_nome)}}" alt="">
                                        <h4><a href="{{route('blog-single', ['post' => $post->id])}}">{{$post->titulo}}</a></h4>
                                        <time datetime="{{$post->data}}">{{\Carbon\Carbon::parse($post->data)->format('d/m/Y')}}</time>
                                    </div>
                                @endforeach

                            </div><!-- End sidebar recent posts-->

                            <h3 class="sidebar-title">Tags</h3>
                            <div class="sidebar-item tags">
                                <ul>
                                    @foreach($tagis as $tagi)
                                        <li><a href="{{route('blog')}}?cat=&tag={{$tagi->id}}">{{$tagi->nome}}</a></li>
                                    @endforeach
                                </ul>
                            </div><!-- End sidebar tags-->

                        </div><!-- End sidebar -->

                    </div><!-- End blog sidebar -->

                </div>

            </div>
        </section><!-- End Blog Single Section -->

    </main><!-- End #main -->

@endsection
