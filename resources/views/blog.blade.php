@extends('layouts.casaamarela')

@section('conteudo')

    <main id="main">

        <!-- ======= Breadcrumbs ======= -->
        <section class="breadcrumbs">
            <div class="container">

                <ol>
                    <li><a href="{{route('/')}}">Home</a></li>
                    <li>Todos os Artigos</li>
                </ol>
                <h2>Artigos</h2>

            </div>
        </section><!-- End Breadcrumbs -->

        <!-- ======= Blog Section ======= -->
        <section id="blog" class="blog">
            <div class="container" data-aos="fade-up">

                <div class="row">

                    <div class="col-lg-8 entries">

                        @foreach($posts as $post)
                            <?php  $commentsCount = App\Models\Comment::where([
                                ['post_id', '=', $post->id],
                                ['publica', '=', 's'], ])->count(); ?>
                            <article class="entry">
                                <div class="entry-img">
                                    <img src="{{asset($post->foto_path)}}" alt="" class="img-fluid">
                                </div>

                                <h2 class="entry-title">
                                    <a href="{{route('blog-single', ['post' => $post->id])}}">{{$post->titulo}}</a>
                                </h2>

                                <div class="entry-meta">
                                    <ul>
                                        <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a>{{ $post->user->name}}</a></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a><time datetime="2020-01-01">{{\Carbon\Carbon::parse($post->data)->format('d/m/Y')}}</time></a></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a>{{$commentsCount}} Comentários</a></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-hand-thumbs-up"><a>({{$post->positivo}})</a></i></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-hand-thumbs-down"><a>({{$post->negativo}})</a></i></li>
                                    </ul>
                                </div>

                                <div class="entry-content">
                                    {!! $post->resumo !!}
                                    <div class="read-more">
                                        <a href="{{route('blog-single', ['post' => $post->id])}}">Leia Mais</a>
                                    </div>
                                </div>
                            </article><!-- End blog entry -->
                        @endforeach

                            <div class="blog-pagination">
                                <?php $posts->appends(['cat' => '', 'tag' => '']); ?>
                            {{$posts->links()}}
                        </div>

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
                                @foreach($recentPosts as $recentPost)
                                    <div class="post-item clearfix">
                                        <img src="{{asset('site/img/thumbnail/'.$recentPost->foto_nome)}}" alt="">
                                        <h4><a href="{{route('blog-single', ['post' => $recentPost->id])}}">{{$recentPost->titulo}}</a></h4>
                                        <time datetime="2020-01-01">{{Carbon\Carbon::parse($recentPost->data)->format('d/m/Y')}}</time>
                                    </div>
                                @endforeach
                            </div><!-- End sidebar recent posts-->

                            <h3 class="sidebar-title">Tags</h3>
                            <div class="sidebar-item tags">
                                <ul>
                                    @foreach($tags as $tag)
                                        <li><a href="{{route('blog')}}?cat=&tag={{$tag->id}}">{{$tag->nome}}</a></li>
                                    @endforeach
                                </ul>
                            </div><!-- End sidebar tags-->

                        </div><!-- End sidebar -->

                    </div><!-- End blog sidebar -->

                </div>

            </div>
        </section><!-- End Blog Section -->

    </main><!-- End #main -->

@endsection
