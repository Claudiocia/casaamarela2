@extends('layouts.casaamarela')
@section('conteudo')
    <!-- Page Content -->
    <main style="margin-top: 100px;">
        {{ $slot }}
    </main>
    </div>

    @stack('modals')

    @livewireScripts
@endsection

