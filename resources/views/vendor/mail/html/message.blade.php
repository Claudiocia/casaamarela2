@component('mail::layout')
{{-- Header --}}
@slot('header')
@component('mail::header', ['url' => config('app.url')])
    <img src="{{asset('site/img/logo_pluri_horizontal.png')}}" alt="" width="50%">
@endcomponent
@endslot

{{-- Body --}}
{{ $slot }}

{{-- Subcopy --}}
@isset($subcopy)
@slot('subcopy')
@component('mail::subcopy')
{{ $subcopy }}
@endcomponent
@endslot
@endisset

{{-- Footer --}}
@slot('footer')
@component('mail::footer')
    <div class="col-lg-5 col-md-12 footer-info">
        <a href="https://pluripensar.com.br" class="logo d-flex align-items-center">
            <img src="{{asset('site/img/logo_pluri_horizontal.png')}}" alt="" width="50%">
        </a>
        <p>Um Espaço para o debate sobre o ensino superior gratuito e de qualidade. Veja como participar</p>
        <div class="social-links mt-3">
        </div>
    </div>
© {{ date('Y') }} {{ config('app.name') }}. @lang('All rights reserved.')
@endcomponent
@endslot
@endcomponent
