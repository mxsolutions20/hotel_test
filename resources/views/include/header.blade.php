<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <!-- Logo -->
                <div class="logo">
                    <h1><a href="#">Hotel Manager</a></h1>
                </div>
            </div>
            <div class="col-md-6">
                <div class="navbar navbar-inverse" role="banner">
                    <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
                        <ul class="nav navbar-nav">
                            <li class="dropdown idiomas">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{ trans('menu.idioma') }} <b class="caret"></b></a>
                                <ul class="dropdown-menu animated fadeInUp">
                                    <li>
                                        <a href="{{ URL::to('lang/en') }}">
                                            <div class="col-md-4">
                                                <img src="{{ asset('public/images/flat/24/United-States.png') }}"/>
                                            </div>
                                            <div class="col-md-8" style="padding-top: 3px;">
                                                <p>Ingles</p>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="{{ URL::to('lang/es') }}">
                                            <div class="col-md-4">
                                                <img src="{{ asset('public/images/flat/24/Spain.png') }}"/>
                                            </div>
                                            <div class="col-md-8" style="padding-top: 3px;">
                                                <p>Español</p>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">{{ trans('menu.cuenta') }} <b class="caret"></b></a>
                                <ul class="dropdown-menu animated fadeInUp">
                                    <!--<li><a href="">{{ trans('menu.perfil') }}</a></li>-->
                                    <li><a href="{{ URL::to('admin/logout') }}">{{ trans('menu.salir') }}</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>