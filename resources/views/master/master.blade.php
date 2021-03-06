<!DOCTYPE html>
<html>
<head>
    <title>@yield('title')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="{{asset('public/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
    
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    

    @yield('css')

    <!-- styles -->
    <link href="{{asset('public/css/styles.css')}}" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>

@include('include.header')

@yield('content')

{{-- @include('include.footer') --}}

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<!--<script src="{{asset('public/js/jquery.js')}}"></script>-->
<script src="{{asset('public/js/jquery.min.js')}}"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="{{asset('public/bootstrap/js/bootstrap.min.js')}}"></script>
<script src="{{asset('public/js/custom.js')}}"></script>
<script>
    var _root_ = "{{ URL::to('admin') }}/";
    var _wait_ = "{{asset('public/images/wait.gif')}}";
</script>
@yield('scripts')
</body>
</html>