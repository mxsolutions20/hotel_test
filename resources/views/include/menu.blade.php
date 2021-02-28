<?php
use Illuminate\Support\Facades\Route;
$ruta = Route::currentRouteName();
?>
<ul class="nav">
    <li class="@if($ruta == 'index') current @endif">
        <a href="{{ URL::to('admin') }}"><i class="glyphicon glyphicon-home"></i> {{ trans('menu.home') }}</a>
    </li>


    @permission('usuario_list')
    <li class="@if($ruta == 'users') current @endif">
        <a href="{{ URL::to('admin/users') }}">
            <i class="glyphicon glyphicon-list"></i> {{ trans('menu.usuarios') }}
        </a>
    </li>
    @endpermission
    
    <li class="@if($ruta == 'hotels') current @endif">
        <a href="{{ URL::to('admin/hotels') }}">
            <i class="glyphicon glyphicon-list"></i> {{ trans('menu.hoteles') }}
        </a>
    </li>
    
</ul>
