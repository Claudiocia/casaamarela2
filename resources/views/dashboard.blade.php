@extends('layouts.casaamarela')
@section('conteudo')
    @if(Auth::user()->role == 1 || Auth::user()->role == 2)
        <x-welcome-admin />
    @elseif(Auth::user()->role == 3)
        <x-welcome-logado />
    @elseif(Auth::user()->role == 4)
        <x-welcome-client />
    @endif
@endsection
