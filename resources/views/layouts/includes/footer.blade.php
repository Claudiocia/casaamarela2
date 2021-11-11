<!-- ======= Footer ======= -->
<footer id="footer" class="footer">

    <div class="footer-top">
        <div class="container">
            <div class="row gy-4">
                <div class="col-lg-5 col-md-12 footer-info">
                    <a href="{{route('/')}}" class="logo d-flex align-items-center">
                        <img src="{{asset('site/img/logo_pluri_horizontal.png')}}" alt="">
                    </a>
                    <p>Um Espaço para o debate sobre o ensino superior gratuito e de qualidade. Veja como participar</p>
                    <div class="social-links mt-3">
                    </div>
                </div>

                <div class="col-lg-2 col-6 footer-links">
                    <h4>Links</h4>
                    @if(Auth::guest())
                        <ul>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{route('contribuis.create')}}">Participar</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{route('contacts.create')}}">Contato</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{ route('register') }}#cadastro">Cadastro</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{ route('login') }}">Login</a></li>
                        </ul>
                    @else
                        <ul>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{route('dashboard')}}">Home</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{route('contribuis.create')}}">Participar</a></li>
                            <li><i class="bi bi-chevron-right"></i> <a href="{{route('contacts.create')}}">Contato</a></li>
                            <li><i class="bi bi-chevron-right"></i>
                                <form method="POST" action="{{ route('logout') }}">
                                    @csrf

                                    <x-jet-dropdown-link href="{{ route('logout') }}"
                                                         onclick="event.preventDefault();
                                                            this.closest('form').submit();">
                                        {{ __('Logout') }}
                                    </x-jet-dropdown-link>
                                </form></li>
                        </ul>
                    @endif
                </div>

                <div class="col-lg-3 col-md-12 footer-contact text-center text-md-start">

                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="copyright">
            &copy; Copyright <strong><span>MarketingMix</span></strong>. Todos os direitos reservados.
        </div>
        <div class="credits">
            Designed by <a href="#">MarketingMix</a>
        </div>
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="{{asset('site/vendor/bootstrap/js/bootstrap.bundle.js')}}"></script>
<script src="{{asset('site/vendor/aos/aos.js')}}"></script>
<script src="{{asset('site/vendor/php-email-form/validate.js')}}"></script>
<script src="{{asset('site/vendor/swiper/swiper-bundle.min.js')}}"></script>
<script src="{{asset('site/vendor/purecounter/purecounter.js')}}"></script>
<script src="{{asset('site/vendor/isotope-layout/isotope.pkgd.min.js')}}"></script>
<script src="{{asset('site/vendor/glightbox/js/glightbox.min.js')}}"></script>

<!-- Template Main JS File -->
<script src="{{asset('site/js/main.js')}}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.mask/1.14.11/jquery.mask.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/5.5.2/bootbox.min.js"></script>
<script src="{{asset('ckeditor/ckeditor.js')}}"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.ckeditor').ckeditor();
    });
</script>
<script type="text/javascript">
            $("#celular").mask('(00) 00000-0000');
</script>
<script src="{{asset('bootbox/bootbox.min.js')}}"></script>
<script src="{{asset('bootbox/bootbox.locales.min.js')}}"></script>
<script type="text/javascript">
    $(document).on("click", ".show-alert", function(e) {
        bootbox.alert("Hello world!", function() {
            console.log("Alert Callback");
        });
    });
</script>

<script type="text/javascript">
    function handleInput(e) {
        var ss = e.target.selectionStart;
        var se = e.target.selectionEnd;
        e.target.value = e.target.value.toUpperCase();
        e.target.selectionStart = ss;
        e.target.selectionEnd = se;
    }
</script>
@livewireScripts
</body>

</html>
