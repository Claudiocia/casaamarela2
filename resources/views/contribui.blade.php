@extends('layouts.casaamarela')

@section('conteudo')

    <!-- ======= Hero Section ======= -->
    <section id="hero" class="hero d-flex align-items-center">

        <div class="container">
            <div class="row">
                <div class="col-lg-6 d-flex flex-column justify-content-center" style="margin-top: 50px">
                    @if(Auth::guest())
                        <h5 data-aos="fade-up">Para contribuir envie o formulário abaixo com sua ideia, limitada a 500 caracteres!</h5>
                    <h6 data-aos="fade-up" data-aos-delay="400" class="bg-danger aviso">Se você quer contribuir com um texto maior faça seu cadastro <a href="{{route('register')}}" style="text-decoration: underline; color: white"> AQUI </a></h6>
                    <h6 data-aos="fade-up" data-aos-delay="400">Os campos com * são obrigatórios</h6>
                    <div data-aos="fade-up" data-aos-delay="600">
                        <x-jet-validation-errors class="mb-4" />

                            <form action="{{route('contribuis.store')}}" method="POST">
                                @csrf
                                <input type="hidden" name="user" value=""/>
                                <div class="row gy-4">
                                    <div class="col-md-6">
                                        <input type="text" name="name" class="form-control" placeholder="Nome*" value="{{old('name')}}" required>
                                    </div>

                                    <div class="col-md-6 ">
                                        <input type="text" class="form-control" name="phone" placeholder="Seu telefone">
                                    </div>

                                    <div class="col-md-12 ">
                                        <input type="email" class="form-control" name="email" placeholder="Seu Email*" value="{{old('email')}}" required>
                                    </div>

                                    <div class="col-md-12">
                                        <select class="form-control" name="tema">
                                            <option value="">Selecione o tema...*</option>
                                            <option @if(old('tema') == 'Graduação') {{'selected="selected"'}} @endif>Graduação</option>
                                            <option @if(old('tema') == 'Pós-Graduação') {{'selected="selected"'}} @endif>Pós-Graduação</option>
                                            <option @if(old('tema') == 'EAD') {{'selected="selected"'}} @endif>EAD</option>
                                            <option @if(old('tema') == 'Extensão') {{'selected="selected"'}} @endif>Extensão</option>
                                            <option @if(old('tema') == 'Pesquisa e Inovação') {{'selected="selected"'}} @endif>Pesquisa e Inovação</option>
                                            <option @if(old('tema') == 'Internacionalização') {{'selected="selected"'}} @endif>Internacionalização</option>
                                            <option @if(old('tema') == 'Gestão e Organização') {{'selected="selected"'}} @endif>Gestão e Organização</option>
                                            <option @if(old('tema') == 'Gestão de Pessoas') {{'selected="selected"'}} @endif>Gestão de Pessoas</option>
                                            <option @if(old('tema') == 'Infraestrutura') {{'selected="selected"'}} @endif>Infraestrutura</option>
                                            <option @if(old('tema') == 'Planejamento e Avaliação Institucional') {{'selected="selected"'}} @endif>Planejamento e Avaliação Institucional</option>
                                            <option @if(old('tema') == 'Assistência Estudantil') {{'selected="selected"'}} @endif>Assistência Estudantil</option>
                                            <option @if(old('tema') == 'Resp. Social e Ações Afirmativas') {{'selected="selected"'}} @endif>Resp. Social e Ações Afirmativas</option>
                                            <option @if(old('tema') == 'Comunicação e Cultura') {{'selected="selected"'}} @endif>Comunicação e Cultura</option>
                                            <option @if(old('tema') == 'Tecnologia e Conectividade') {{'selected="selected"'}} @endif>Tecnologia e Conectividade</option>
                                        </select>
                                    </div>

                                    <div class="col-md-12">
                                        <textarea class="form-control" name="contribui" rows="6" placeholder="Descreva a sua ideia*"  required maxlength="510">{{old('contribui')}}</textarea>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <x-jet-button class="ml-4" style="width:40%; display: flex; justify-content: center;">
                                            {{ __('Enviar') }}
                                        </x-jet-button>
                                    </div>
                                </div>
                            </form>
                        @else
                            <h5 data-aos="fade-up">Para contribuir envie o formulário abaixo com sua ideia!</h5>
                            <div data-aos="fade-up" data-aos-delay="600">
                                <x-jet-validation-errors class="mb-4" />
                            <form action="{{route('contribuis.store')}}" method="POST">
                                @csrf
                                <input type="hidden" name="user" value="{{Auth::user()->id}}">
                                <div class="row gy-4">
                                    <div class="col-md-6">
                                        <input type="text" name="name" class="form-control" placeholder="Seu Nome" value="{{Auth::user()->name}}" disabled>
                                    </div>

                                    <div class="col-md-6 ">
                                        <input type="text" class="form-control" name="phone" placeholder="Seu telefone" value="{{Auth::user()->celular}}" disabled>
                                    </div>

                                    <div class="col-md-12 ">
                                        <input type="email" class="form-control" name="email" placeholder="Seu Email" value="{{Auth::user()->email}}" disabled>
                                    </div>

                                    <div class="col-md-12">
                                        <select class="form-control" name="tema">
                                            <option value="">Selecione o tema...*</option>
                                            <option @if(old('tema') == 'Graduação') {{'selected="selected"'}} @endif>Graduação</option>
                                            <option @if(old('tema') == 'Pós-Graduação') {{'selected="selected"'}} @endif>Pós-Graduação</option>
                                            <option @if(old('tema') == 'EAD') {{'selected="selected"'}} @endif>EAD</option>
                                            <option @if(old('tema') == 'Extensão') {{'selected="selected"'}} @endif>Extensão</option>
                                            <option @if(old('tema') == 'Pesquisa e Inovação') {{'selected="selected"'}} @endif>Pesquisa e Inovação</option>
                                            <option @if(old('tema') == 'Internacionalização') {{'selected="selected"'}} @endif>Internacionalização</option>
                                            <option @if(old('tema') == 'Gestão e Organização') {{'selected="selected"'}} @endif>Gestão e Organização</option>
                                            <option @if(old('tema') == 'Gestão de Pessoas') {{'selected="selected"'}} @endif>Gestão de Pessoas</option>
                                            <option @if(old('tema') == 'Infraestrutura') {{'selected="selected"'}} @endif>Infraestrutura</option>
                                            <option @if(old('tema') == 'Planejamento e Avaliação Institucional') {{'selected="selected"'}} @endif>Planejamento e Avaliação Institucional</option>
                                            <option @if(old('tema') == 'Assistência Estudantil') {{'selected="selected"'}} @endif>Assistência Estudantil</option>
                                            <option @if(old('tema') == 'Resp. Social e Ações Afirmativas') {{'selected="selected"'}} @endif>Resp. Social e Ações Afirmativas</option>
                                            <option @if(old('tema') == 'Comunicação e Cultura') {{'selected="selected"'}} @endif>Comunicação e Cultura</option>
                                            <option @if(old('tema') == 'Tecnologia e Conectividade') {{'selected="selected"'}} @endif>Tecnologia e Conectividade</option>
                                        </select>
                                    </div>

                                    <div class="col-md-12">
                                        <textarea class="form-control" name="contribui" rows="6" placeholder="Descreva a sua ideia*"  required>{{old('contribui')}}</textarea>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <x-jet-button class="ml-4" style="width:40%; display: flex; justify-content: center;">
                                            {{ __('Enviar') }}
                                        </x-jet-button>
                                    </div>
                                </div>
                            </form>
                        @endif
                    </div>
                </div>
                <div class="col-lg-6 hero-img" data-aos="zoom-out" data-aos-delay="200" style="margin-top: 50px">
                    <img src="{{asset('site/img/hero-img.png')}}" class="img-fluid" alt="">
                </div>
            </div>
        </div>

    </section><!-- End Hero -->

    <main id="main">

    </main><!-- End #main -->

@endsection
