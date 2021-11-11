@extends('layouts.casaamarela')

@section('conteudo')

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="hero d-flex align-items-center">

        <div class="container">
            <div class="row">
                <div class="col-lg-6 d-flex flex-column justify-content-center">
                    <h1 data-aos="fade-up">Um espaço aberto ao debate plural sobre a universidade pública</h1>
                    <h2 data-aos="fade-up" data-aos-delay="400">Existem várias maneiras de participar!</h2>
                    <div data-aos="fade-up" data-aos-delay="600">
                        <div class="text-center text-lg-start">
                            <a href="{{route('contribuis.create')}}" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
                                <span>Participe</span>
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                        <div class="text-center text-lg-start">
                            <a href="{{route('/')}}#recent-blog-posts" class="btn-get-started scrollto d-inline-flex align-items-center justify-content-center align-self-center">
                                <span>Leia nossos artigos</span>
                                <i class="bi bi-arrow-right"></i>
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 hero-img" data-aos="zoom-out" data-aos-delay="200">
                    <img src="{{asset('site/img/hero-img.png')}}" class="img-fluid" alt="">
                </div>
            </div>
        </div>

    </section><!-- End Hero -->

    <main id="main">

        <!-- ======= Recent Blog Posts Section ======= -->
        <section id="recent-blog-posts" class="recent-blog-posts">

            <div class="container" data-aos="fade-up">

                <header class="section-header">
                    <h2>Blog</h2>
                    <p>Artigos mais recentes</p>
                </header>

                <div class="row">

                    @foreach($posts as $post)
                        <div class="col-lg-4">
                            <div class="post-box">
                                @if($post->foto_path != null)
                                    <div class="post-img"><img src="{{asset($post->foto_path)}}" class="img-fluid" alt=""></div>
                                @else
                                    <div class="post-img"><img src="{{asset('site/img/sem_foto.png')}}" class="img-fluid" alt=""></div>
                                @endif
                                <span class="post-date">{{\Carbon\Carbon::parse($post->data)->format('d/m/Y')}}</span>
                                <h3 class="post-title">{{$post->titulo}}</h3>
                                <a href="{{route('blog-single', ['post' => $post->id])}}" class="readmore stretched-link mt-auto"><span>Leia Mais</span><i class="bi bi-arrow-right"></i></a>
                            </div>
                        </div>
                    @endforeach
                    </div>

                </div>

            </div>

        </section><!-- End Recent Blog Posts Section -->

    </main><!-- End #main -->

@endsection
