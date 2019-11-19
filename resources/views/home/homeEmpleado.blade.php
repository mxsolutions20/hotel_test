@extends('master.master')

@section('title', 'Home')

@section('content')

    <div class="page-content">
        <div class="row">
            <div class="col-md-2">
                <div class="sidebar content-box" style="display: block;">
                    @include('include.menu')
                </div>
            </div>
            <div class="col-md-10">

                <div class="row">

                    <div class="col-md-12 panel-warning">
                        <div class="content-box-header panel-heading">
                            <div class="panel-title ">WELLCOME TO HOTEL MANAGER</div>
                        </div>
                        <div class="content-box-large box-with-header" style="min-height: 50vh;">
                            <h2 class="text-center" style="margin: 0"></h2>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

@endsection