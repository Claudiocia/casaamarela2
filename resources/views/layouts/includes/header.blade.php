<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'PluriPensares') }}</title>
    <meta property="og:image" content="{{asset('site/img/logo_pluri_round.png')}}" />
    <meta property="og:description" content="Um espaço para o debate sobre a educação superior pública."/>
    <meta content="Um espaço para o debate sobre a educação superior pública." name="description">

    <meta content="educação universidade" name="keywords">

    <!-- Favicons -->
    <link href="{{asset('site/img/favicon.png')}}" rel="icon">
    <link href="{{asset('site/img/apple-touch-icon.png')}}" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <!-- Styles -->
    <link rel="stylesheet" href="{{ mix('css/app.css') }}">

    @livewireStyles

    <!-- Scripts -->
    <script src="{{ mix('js/app.js') }}"></script>


    <!-- Vendor CSS Files -->
    <link href="{{asset('site/vendor/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
    <link href="{{asset('site/vendor/bootstrap-icons/bootstrap-icons.css')}}" rel="stylesheet">
    <link href="{{asset('site/vendor/aos/aos.css')}}" rel="stylesheet">
    <link href="{{asset('site/vendor/remixicon/remixicon.css')}}" rel="stylesheet">
    <link href="{{asset('site/vendor/swiper/swiper-bundle.min.css')}}" rel="stylesheet">
    <link href="{{asset('site/vendor/glightbox/css/glightbox.min.css')}}" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="{{asset('site/css/style.css')}}" rel="stylesheet">

</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top">
    <div class="container-fluid container-xl d-flex align-items-center justify-content-between">

        <a href="{{route('/')}}" class="logo d-flex align-items-center">
            <img src="{{asset('site/img/logo_pluri_horizontal.png')}}" alt="" height="60px">

        </a>
        @if(Auth::guest())
        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto" href="{{route('/')}}">Home</a></li>
                <li><a class="nav-link scrollto" href="{{route('contribuis.create')}}">Participar</a> </li>
                <li><a class="nav-link scrollto" href="{{route('contacts.create')}}">Contato</a></li>
                <li><a class="nav-link scrollto" href="{{route('blog')}}?cat=&tag=">Artigos</a></li>
                <li><a href="{{ route('register') }}#cadastro">Cadastro</a></li>
                <li><a href="{{ route('login') }}">Login</a></li>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->
        @else
            <nav id="navbar" class="navbar">
                <ul>
                    <li><a class="nav-link scrollto" href="{{route('dashboard')}}#hero">Home</a></li>
                    <li><a class="nav-link scrollto" href="{{route('contacts.create')}}">Contato</a></li>
                    <li><a class="nav-link scrollto" href="{{route('contribuis.create')}}">Participar</a></li>
                    <li><a class="nav-link scrollto" href="{{route('blog')}}?cat=&tag=">Artigos</a></li>
                    @if(Auth::user()->role == 1 || Auth::user()->role == 2)
                        <li class="dropdown"><a href="#"><span>Admin</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a class="nav-link scrollto" href="{{route('redat.dimensions.index')}}">Dimensões</a></li>
                                <li><a class="nav-link scrollto" href="{{route('admin.users.index')}}">Usuários</a></li>
                                <li><a class="nav-link scrollto" href="{{route('admin.posts.index')}}">Blog</a></li>
                                <li><a class="nav-link scrollto" href="#">Lideres</a></li>
                            </ul>
                        </li>
                        <li><a class="nav-link scrollto" href="{{route('redat.contribuis.index')}}">Contribuições</a></li>
                        <li><a class="nav-link scrollto" href="{{route('admin.contacts.index')}}">Mensagens</a></li>
                    @elseif(Auth::user()->role == 3)
                        <li class="dropdown"><a href="#"><span>Edição</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a class="nav-link scrollto" href="{{route('dashboard')}}">Dimensões</a></li>
                                <li><a class="nav-link scrollto" href="#">Eixos</a></li>
                                <li><a class="nav-link scrollto" href="{{route('redat.contribuis.index')}}">Contribuições</a></li>
                            </ul>
                    @endif
                    <li class="dropdown"><a href="#"><span>{{ Auth::user()->name }}</span> <i class="bi bi-chevron-right"></i></a>
                        <ul>
                            <li><a href="{{route('profile.show')}}">Perfil</a></li>
                            <li>
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf

                                    <x-jet-dropdown-link href="{{ route('logout') }}"
                                                         onclick="event.preventDefault();
                                                            this.closest('form').submit();">
                                        {{ __('Logout') }}
                                    </x-jet-dropdown-link>
                                </form>
                            </li>
                        </ul>
                    </li>
                </ul>
                <i class="bi bi-list mobile-nav-toggle"></i>
            </nav><!-- .navbar -->
        @endif
    </div>
</header><!-- End Header -->
@if(Session::has('msg'))
    <div id="myAlert" class="alert alert-success alert-dismissible fade show" style="width: 400px; margin-top: 80px; margin-left: 150px;">
        {!! Session::get('msg') !!}
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
@endif
