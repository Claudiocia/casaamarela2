@extends('layouts.casaamarela')

@section('conteudo')
    <main id="main">
        <!-- ======= Contact Section ======= -->
        <section id="contact" class="contact">

            <div class="container" data-aos="fade-up">

                <header class="section-header">
                    <p>Fale conosco</p>
                </header>

                <div class="row gy-4">
                    <div class="col-lg-6 hero-img" data-aos="zoom-out" data-aos-delay="200">
                        <img src="{{asset('site/img/contact-img2.png')}}" class="img-fluid" alt="">
                    </div>

                    <div class="col-lg-6">
                        <x-jet-validation-errors class="mb-4" />
                        @if(Auth::guest())
                        <h6>Todos os campos são obrigatórios!</h6>
                        <form action="{{route('contacts.store')}}" method="POST">
                            @csrf
                            <div class="row gy-4">
                                <div class="col-md-6">
                                    <input type="text" name="name" class="form-control" placeholder="Seu Nome*" value="{{old('name')}}" required>
                                </div>

                                <div class="col-md-6 ">
                                    <input type="text" class="form-control" name="phone" placeholder="Seu telefone*" value="{{old('phone')}}" required>
                                </div>

                                <div class="col-md-12 ">
                                    <input type="email" class="form-control" name="email" placeholder="Seu Email*" value="{{old('email')}}" required>
                                </div>

                                <div class="col-md-12">
                                    <input type="text" class="form-control" name="subject" placeholder="Assunto*" value="{{old('subject')}}" required>
                                </div>

                                <div class="col-md-12">
                                    <textarea class="form-control" name="message" rows="6" placeholder="Mensagem*" required>{{old('message')}}</textarea>
                                </div>
                                <div class="d-flex justify-content-center">
                                <x-jet-button class="ml-4" style="width:40%; display: flex; justify-content: center;">
                                    {{ __('Enviar Mensagem') }}
                                </x-jet-button>
                                </div>
                            </div>
                        </form>
                        @else
                            <h6>Todos os campos são obrigatórios!</h6>
                            <form action="{{route('contacts.store')}}" method="POST">
                                @csrf
                                <div class="row gy-4">
                                    <div class="col-md-6">
                                        <input type="text" name="name" class="form-control" placeholder="Seu Nome*" value="{{Auth::user()->name}}" required>
                                    </div>

                                    <div class="col-md-6 ">
                                        <input type="text" class="form-control" name="phone" placeholder="Seu telefone*" value="{{Auth::user()->celular}}" required>
                                    </div>

                                    <div class="col-md-12 ">
                                        <input type="email" class="form-control" name="email" placeholder="Seu Email*" value="{{Auth::user()->email}}" required>
                                    </div>

                                    <div class="col-md-12">
                                        <input type="text" class="form-control" name="subject" placeholder="Assunto*" value="{{old('subject')}}" required>
                                    </div>

                                    <div class="col-md-12">
                                        <textarea class="form-control" name="message" rows="6" placeholder="Mensagem*" required>{{old('message')}}</textarea>
                                    </div>
                                    <div class="d-flex justify-content-center">
                                        <x-jet-button class="ml-4" style="width:40%; display: flex; justify-content: center;">
                                            {{ __('Enviar Mensagem') }}
                                        </x-jet-button>
                                    </div>
                                </div>
                            </form>
                        @endif
                    </div>

                </div>

            </div>

        </section><!-- End Contact Section -->

    </main><!-- End #main -->

@endsection
