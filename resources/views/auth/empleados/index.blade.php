@extends('auth.master')

@section('title', 'Login')

@section('content')
    <div class="page-content container">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-wrapper">
                    <div class="box">
                        {!! Form::open(['route' => 'auth/admin', 'class' => '' , 'id' => '' , 'role' => 'login']) !!}
                            <div class="content-wrap">
                                <h6>Sign In</h6>

                                @include('flash::message')

                                <input name="usuario" class="form-control" type="text" placeholder="User" value="{{old('usuario')}}">
                                @if(count($errors) > 0)
                                    @if($errors->has('usuario'))
                                        <span class="help-block text-left">{{$errors->first('usuario')}}</span>
                                    @endif
                                @endif

                                <input name="clave" class="form-control" type="password" placeholder="Password" value="{{old('clave')}}">
                                @if(count($errors) > 0)
                                    @if($errors->has('clave'))
                                        <span class="help-block text-left">{{$errors->first('clave')}}</span>
                                    @endif
                                @endif

                                <div class="action">
                                    <button type="submit" class="btn btn-primary signup">Login</button>
                                </div>
                            </div>
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection