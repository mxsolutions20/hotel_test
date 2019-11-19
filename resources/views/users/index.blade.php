@extends('master.master')

@section('title', 'Home')


@section('include')
    {{-- trans('menu.perfil') --}}
@endsection

@section('css')
    <link rel="stylesheet" href="{{ asset('public/css/bootstrap-formhelpers.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('public/css/alertify.min.css') }}" />
    <link rel="stylesheet" href="{{ asset('public/css/alertify-default-theme.min.css') }}" />
@endsection

@section('scripts')
    <script src="{{asset('public/js/bootstrap-waitingfor.js')}}"></script>
    <script src="{{asset('public/js/bootstrap-formhelpers.min.js')}}"></script>
    <script src="{{asset('public/js/bootstrap-validator.min.js') }}"></script>
    <script src="{{asset('public/js/alertify.min.js')}}"></script>
    <script src="{{asset('public/js/site/usuarios/users.js')}}"></script>
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
                        <span class="breadcrumb-item active">{{ trans('forms.users') }}</span>
                    </nav>
                    <div class="content-box-large">
                        <div class="panel-heading">
                            <div class="col-md-5 pl-0">
                                <a class="btn btn-info btn-sm" id="create_user">{{ trans('forms.nuevousuario') }}</a>
                            </div>
                        </div>
                        <div class="panel-body">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th width="50">#</th>
                                        <th width="200">{{ trans('forms.nombre') }}</th>
                                        <th width="200">{{ trans('forms.correo') }}</th>
                                        <th width="200">{{ trans('forms.username') }}</th>
                                        <th width="100">{{ trans('forms.status') }}</th>
                                        <th width="150">{{ trans('forms.rol') }}</th>
                                        <th width="200"></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($usuarios as $index => $usuario)
                                    <tr>
                                        <th scope="row" style="vertical-align: middle;">{{$index + 1}}</th>
                                        <td style="vertical-align: middle;">
                                            {{ $usuario->name }}
                                        </td>
                                        <td style="vertical-align: middle;">
                                            {{ $usuario->email }}
                                        </td>
                                        <td style="vertical-align: middle;">
                                            {{ $usuario->user }}
                                        </td>
                                        <td style="vertical-align: middle;">
                                            @if($usuario->estatus == '1')
                                                <strong class="text-success">{{ trans('forms.active') }}</strong>
                                            @else
                                                <strong class="text-danger">{{ trans('forms.inactive') }}</strong>
                                            @endif
                                        </td>
                                        <td style="vertical-align: middle;">
                                            @foreach($usuario->role as $role)
                                                {{ $role->role_rel->display_name }} <br>
                                            @endforeach
                                        </td>
                                        <td class="text-center" style="vertical-align: middle;">
                                            <span class="glyphicon glyphicon-edit icon-function edit_user" 
                                                  data-user="{{$usuario->id}}"
                                                  data-name="{{ $usuario->name }}"
                                                  data-email="{{ $usuario->email }}"
                                                  data-username="{{ $usuario->user }}"
                                                  data-active="{{ $usuario->estatus }}"></span>
                                            <span class="glyphicon glyphicon-lock icon-function role_user" style="margin: 0 25px;" data-user="{{$usuario->id}}"></span>
                                            <span class="glyphicon glyphicon-remove icon-function delete_user" 
                                                  data-user="{{$usuario->id}}"
                                                  data-name="{{ $usuario->name }}"></span>
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


<div class="modal fade" id="new_user_modal" tabindex="-1" role="dialog" aria-labelledby="newModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header flat">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="newModal">{{ trans('forms.nuevousuario') }}</h4>
            </div>
            <form action="post" id="form_new_user">
            <div class="modal-body flat">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div id="alert" class="alert alert-danger" style="display:none">
                            <div id="alert-content"></div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="inputName" class="col-sm-2 control-label">{{ trans('forms.nombre') }}</label>
                        <div class="col-sm-10">
                            <input type="text" 
                                   id="name" 
                                   class="form-control" 
                                   name="name"
                                   autocomplete="off"
                                   requiered />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">{{ trans('forms.email') }}</label>
                        <div class="col-sm-10">
                            <input type="email" 
                                   id="email" 
                                   class="form-control" 
                                   name="email"
                                   autocomplete="off"
                                   required />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputUsername" class="col-sm-2 control-label">{{ trans('forms.user') }}</label>
                        <div class="col-sm-10">
                            <input type="text" 
                                   id="username" 
                                   class="form-control" 
                                   name="user"
                                   autocomplete="off"
                                   required />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-2 control-label">{{ trans('forms.password') }}</label>
                        <div class="col-sm-10">
                            <input type="password" 
                                   id="password" 
                                   class="form-control" 
                                   name="password"
                                   required />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputConfirm" class="col-sm-2 control-label">{{ trans('forms.repassword') }}</label>
                        <div class="col-sm-10">
                            <input type="password" 
                                   id="password_confirmation" 
                                   class="form-control" 
                                   name="password_confirmation"
                                   required />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="avatar" class="col-sm-3 control-label">Avatar</label>
                        <div class="col-sm-9">
                            <input type="file" id="avatar" name="avatar" class="form-control" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer flat">
                <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('forms.cancelar') }}</button>
                <button type="submit" class="btn btn-primary">{{ trans('forms.guardar') }}</button>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="edit_user_modal" tabindex="-1" role="dialog" aria-labelledby="newModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header flat">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="newModal">{{ trans('forms.updateuser') }}</h4>
            </div>
            <form action="post" id="form_update_user">
            <div class="modal-body flat">
                <div class="row">
                    <div class="col-sm-12 text-center">
                        <div id="alert_edit" style="margin-bottom: 10px;">
                        </div>
                    </div>
                    
                    <input type="hidden" id="edit_user_id" class="form-control" name="userId" />
                    <div class="form-group">
                        <label class="col-sm-3 control-label">{{ trans('forms.status') }}</label>
                        <div class="col-sm-9">
                            <label style="margin-right: 20px;">
                                <input type="radio" name="is_active" id="opt_yes" value="1"> {{ trans('forms.active') }}
                            </label>
                            <label>
                                <input type="radio" name="is_active" id="opt_not" value="0"> {{ trans('forms.inactive') }}
                            </label>
                            <br><br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_user_name" class="col-sm-3 control-label">{{ trans('forms.nombre') }}</label>
                        <div class="col-sm-9">
                            <input type="text" 
                                   id="edit_user_name" 
                                   class="form-control" 
                                   name="name"
                                   required />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-3 control-label">{{ trans('forms.email') }}</label>
                        <div class="col-sm-9">
                            <input type="email" 
                                   id="edit_user_email" 
                                   class="form-control" 
                                   name="email"
                                   required />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputUsername" class="col-sm-3 control-label">{{ trans('forms.user') }}</label>
                        <div class="col-sm-9">
                            <input type="text" 
                                   id="edit_username" 
                                   class="form-control" 
                                   name="user"
                                   requiered />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword" class="col-sm-3 control-label">{{ trans('forms.newpassword') }}</label>
                        <div class="col-sm-9">
                            <input type="password" 
                                   id="edit_user_password" 
                                   class="form-control clean_inputs" 
                                   name="password"
                                   placeholder="* * * * * *" />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputConfirm" class="col-sm-3 control-label">{{ trans('forms.renewpassword') }}</label>
                        <div class="col-sm-9">
                            <input type="password" 
                                   id="edit_user_password_confirmation" 
                                   class="form-control clean_inputs" 
                                   name="password_confirmation"
                                   placeholder="* * * * * *" />
                            <br>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="avatar" class="col-sm-3 control-label">Avatar</label>
                        <div class="col-sm-9">
                            <input type="file" id="new_avatar" name="new_avatar" class="form-control" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer flat">
                <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('forms.cancelar') }}</button>
                <button type="submit" class="btn btn-primary">{{ trans('forms.savechanges') }}</button>
            </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="role_user_modal" tabindex="-1" role="dialog" aria-labelledby="titleRolModal" data-backdrop="static">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header flat">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="titleRolModal">{{ trans('forms.useroles') }}</h4>
            </div>
            <div class="modal-body flat">
                <div class="row">
                    <form action="post" id="form_add_role_user">
                        <div class="form-group">
                            <label for="edit_roles" class="col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">{{ trans('forms.roles') }}</label>
                            <div class="col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
                                <div class="input-group">
                                    <input type="hidden" id="role_user_id" class="form-control" name="userId" />
                                    <input type="hidden" id="chooseOpt" class="form-control" name="chooseOpt" value="{{ trans('forms.choose') }}" />
                                    <select name="roleId" id="available_roles" class="form-control" >
                                        <option value="" hidden>Choose...</option>
                                    </select>
                                    <span class="input-group-btn">
                                        <button class="btn btn-success" id="add_user_role" type="submit">{{ trans('forms.add') }}</button>
                                    </span>
                                </div>
                                <br>
                            </div>
                        </div>
                    </form>

                    <div class="col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
                        <table id="roles_table" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th colspan="2" style="text-align: center;font-size: 14px;">{{ trans('forms.useroles') }}</th>
                                </tr>
                            </thead>
                            <tbody id="user_roles">
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="modal-footer flat">
                <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('forms.close') }}</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="confirm_delete_modal" tabindex="-1" role="dialog" aria-labelledby="" aria-hidden="true">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <form data-toggle="validator" role="form" class="form_delete">
                <input type="hidden" id="idguest" value=""/>
                <div class="modal-header flat">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="confirm_title">{{ trans('forms.deleteuser') }}</h4>
                </div>
                <div class="modal-body flat">
                    <h5 class="title" id="confirm_text">{{ trans('forms.deletext') }} <strong id="delete_user_name"></strong>?</h5>
                </div>
                <div class="modal-footer flat">
                    <input type="hidden" id="delete_user_id" >
                    <button type="button" id="delete_user_account" class="btn btn-danger">{{ trans('forms.delete') }}</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">{{ trans('forms.cancelar') }}</button>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection