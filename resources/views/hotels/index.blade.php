@extends('master.master')
@section('title', trans('forms.hotels'))


@section('css')
<link rel="stylesheet" href="{{ asset('public/css/bootstrap-formhelpers.min.css') }}" />
<link rel="stylesheet" href="{{ asset('public/css/alertify.min.css') }}" />
<link rel="stylesheet" href="{{ asset('public/css/alertify-default-theme.min.css') }}" />
@endsection

@section('scripts')
<script src="{{asset('public/js/bootstrap-formhelpers.min.js')}}"></script>
<script src="{{asset('public/js/bootstrap-validator.min.js') }}"></script>
<script src="{{asset('public/js/alertify.min.js')}}"></script>
@endsection


@section('content')
<input type="hidden" name="_token" value="{{ csrf_token() }}">
<div class="page-content">
    <div class="row">
        <div class="col-md-2">
            <div class="sidebar content-box" style="display: block;">
                @include('include.menu')
            </div>
        </div>

        <div class="col-md-10">
            <div class="row">
                <div class="col-md-12">
                    <nav class="breadcrumb">
                        <a class="breadcrumb-item" href="{{ URL::to('admin') }}">{{ trans('menu.home') }}</a>
                        <span class="breadcrumb-item active">{{ trans('forms.hotels') }}</span>
                    </nav>
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="col-md-5 pl-0">
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modal_add_item">
                                    {{ trans('forms.hotel_new') }}
                                </button>
                            </div>

                        </div>
                        <div class="panel-body">

                            <div id="alerts_notifications" style="display:none"></div>

                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th class="col-md-1">#</th>
                                        <th class="col-md-4">{{ trans('forms.nombre') }}</th>
                                        <th class="col-md-3">{{ trans('forms.street') }}</th>
                                        <th class="col-md-3">{{ trans('forms.phone') }}</th>
                                        <th class="col-md-1">{{ trans('forms.status') }}</th>
                                        <th class="col-md-1">{{ trans('forms.actions') }}</th>
                                    </tr>
                                </thead>
                                <tbody id="result_data">
                                    @foreach($hotels as $key => $data)
                                    <tr row_data_id="{{$data->idHotel}}">
                                        <td>{{$data->idHotel}}</td>
                                        <td>{{$data->nombre}}</td>
                                        <td>{{$data->direccion}}</td>
                                        <td>{{$data->telefono}}</td>
                                        <td>
                                            @if($data->estatus == '1')
                                            <strong class="text-success">{{ trans('forms.active') }}</strong>
                                            @else
                                            <strong class="text-danger">{{ trans('forms.inactive') }}</strong>
                                            @endif
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-link btn_delete" id="btn_delete" data_id="{{$data->idHotel}}">{{ trans('forms.delete') }}</button>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="modal_add_item" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">{{trans('forms.new')}}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div id="notifications" style="display:none"></div>
            <form id="frmHotels">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="name" class="col-form-label">{{ trans('forms.nombre') }}</label>
                        <input type="text" id="name" class="form-control" name="name" autocomplete="off" requiered />
                    </div>
                    <div class="form-group">
                        <label for="street" class="col-form-label">{{ trans('forms.street') }}</label>
                        <input type="text" id="street" class="form-control" name="street" autocomplete="off" requiered />
                    </div>
                    <div class="form-group">
                        <label for="phone" class="col-form-label">{{ trans('forms.phone') }}</label>
                        <input type="text" id="phone" class="form-control" name="phone" autocomplete="off" requiered />
                    </div>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{{trans('forms.close')}}</button>
                <button type="button" class="btn btn-primary" id="btn_save">{{trans('forms.save')}}</button>
            </div>
        </div>
    </div>
</div>

@endsection