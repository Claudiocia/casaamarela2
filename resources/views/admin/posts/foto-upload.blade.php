@extends('layouts.casaamarela')

@section('conteudo')
<div class="p-6 sm:px-20 bg-white border-b border-gray-200" style="margin-top: 80px;">
    <div id="admin-content">
        <div class="container-admin">
            <div class="row">
                <div class="col-md-12">
                    <div class="w-auto p-3">
                        <div class="panel-heading-admin">
                            <h5>Upload de foto para o Artigo {{$post->titulo}}</h5>
                        </div>
                        <div class="panel-body">
                            <div class="row btn-new-reset">
                                {!! Button::primary('Voltar')->asLinkTo(route('admin.posts.index')) !!}
                            </div>
                            <div class="form-admin">

                                <form action="{{route('admin.posts.resizeImage')}}" method="post" enctype="multipart/form-data">
                                    @csrf
                                    @if ($message = Session::get('msg'))
                                        <div class="alert alert-success">
                                            <strong>{{ $message }}</strong>
                                        </div>


                                        <div class="col-md-12 mb-3">
                                            <strong>Imagem Salva:</strong><br/>
                                            <img src="{{asset('site/img/uploads/'.Session::get('fileName'))}}" width="550px" />
                                        </div>
                                    @endif

                                    @if (count($errors) > 0)
                                        <div class="alert alert-danger">
                                            <ul>
                                                @foreach ($errors->all() as $error)
                                                    <li>{{ $error }}</li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    @endif
                                    <div class="custom-file">
                                        <input type="file" name="file" class="custom-file-input" id="chooseFile">
                                        <label class="custom-file-label" for="chooseFile">Selecione a imagem</label>
                                        <input type="hidden" name="post" value="{{$post->id}}">
                                    </div>
                                    <div class="row gy-4 mt-3">
                                        <div class="col-md-12 ">
                                            <input type="text" class="form-control" name="foto_legenda" placeholder="Legenda da imagem" value="{{old('foto_legenda')}}">
                                        </div>
                                    </div>

                                    <button type="submit" name="submit" class="btn btn-outline-danger btn-block mt-4">
                                        Upload
                                    </button>
                                </form>
                            </div>
                        </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
