<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="{{asset('public/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
    <!-- styles -->
    <link href="{{asset('public/css/styles.css')}}" rel="stylesheet">

    @yield('css')

    <style>
        .help-block.text-left{
            color: red;
        }
    </style>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body class="login-bg">
<div class="header">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="logo">
                    <h1 class="text-center"><a href="{{URL::to('/')}}">PALAFITOS AT EL DORADO MAROMA</a></h1>
                </div>
            </div>
        </div>
    </div>
</div>

{{--@yield('include')--}}

@yield('content')


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="{{asset('public/js/jquery.js')}}"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="{{asset('public/bootstrap/js/bootstrap.min.js')}}"></script>
<script src="{{asset('public/js/custom.js')}}"></script>
@yield('scripts')
</body>
</html>