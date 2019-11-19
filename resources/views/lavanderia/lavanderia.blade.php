@extends('master.master')

@section('title', 'Home')

@section('css')
    {!! Html::style('public/css/alertify.min.css') !!}
    {!! Html::style('public/css/alertify-default-theme.min.css') !!}
    <link rel="stylesheet" type="text/css" href="{{asset('public/css/bootstrap-formhelpers.css')}}">
@endsection
   

@section('scripts')
    <script src="{{asset('public/js/bootstrap-waitingfor.js')}}"></script>
    <script src="{{asset('public/js/bootstrap-validator.min.js') }}"></script>
    <script type="text/javascript" src="{{asset('public/js/bootstrap-formhelpers.js')}}"></script>  
    {!! Html::script('public/js/alertify.min.js') !!}  
    <script src="{{asset('public/js/site/lavanderia/lavanderia.js')}}"></script>

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
                            <span class="breadcrumb-item active">{{ trans('lists.lavanderia') }}</span>
                        </nav>
                        <div class="content-box-large">
                            <div class="panel-heading">
                                <div class="col-md-6 pl-0">
                                    <a class="btn btn-info btn-sm" id="btn_lavanderia_nuevo">{{ trans('lists.nuevo') }}</a>
                                </div>
                            </div>
                            <div class="panel-body">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>{{ trans('lists.nombre') }}</th>
                                            <th>{{ trans('lists.desCorta') }}</th>
                                            <!-- <th>{{ trans('lists.includes') }}</th> -->
                                            <th>{{ trans('lists.Extra') }}</th>
                                            <th>{{ trans('lists.diasapertura') }}</th>
                                            <th>{{ trans('lists.horario') }}</th>
                                            <th>{{ trans('lists.estatus') }}</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-centered">
                                        @foreach($lavanderia as $lavanderia)
                                        <tr>
                                            <th>{{ $lavanderia->idLavanderia }}</th>
                                            <td>{{ $lavanderia->idioma['nombre'] }}</td>
                                            <td>{{ $lavanderia->idioma['desCorta'] }}</td>
                                             <!--   <td>
                                                    <a href="javascript:void(0)" 
                                                       class="lavanderia_includes" 
                                                       data-idlavanderia="{{ $lavanderia->idLavanderia }}"><strong>{{ trans('lists.includes') }}</strong></a>
                                            </td>
                                                -->                                            
                                            <td>
                                                    <a href="javascript:void(0)" 
                                                       class="lavanderia_extra" 
                                                       data-idlavanderia="{{ $lavanderia->idLavanderia }}"><strong>{{ trans('lists.Extra') }}</strong></a>
                                            </td>
                                            <td>{{ $lavanderia->idioma['dia'] }}</td>
                                            <td>{{ $lavanderia->horario }}</td>
                                            <td>
                                                @if($lavanderia->estatus == 1)
                                                    <strong class="text-success">{{trans('lists.active')}}</strong>
                                                @else
                                                    <strong class="text-danger">{{trans('lists.inactive')}}</strong>
                                                @endif
                                            </td>    

                                            <td>
                                                <span class="glyphicon glyphicon-edit icon-function edit_lavanderia text-info mr-3" 
                                                data-idlavanderia="{{$lavanderia->idLavanderia}}"></span>
                                                <span class="glyphicon glyphicon-remove icon-function text-danger delete_lavanderia text-danger"
                                                data-idlavanderia="{{ $lavanderia->idLavanderia }}"
                                                data-nombre="{{ $lavanderia->idioma['nombre'] }}"></span>
                                                
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

    <!--- Regsitrar Nueva Lavanderia-->
    <div class="modal fade" id="new_lavanderia_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" style="width:1000px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">{{ trans('forms.nuevo')}}</h4>
            </div>
            <form id="frmNewLavanderia" enctype="multipart/form-data" method="post">
                <div class="modal-body">
                    <div class="loading-body">
                        <!-- Loading content gif -->
                    </div>
                    <div class="row p-3">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <strong class="text-info">{{ trans('forms.generalinformacion')}}</strong>
                            </div>
                            <div class="panel-body px-2 py-3">

                                       
                                        <!-- Rango de horas -->
                                        <div class="col-sm-12">
                                            <br/>
                                            <label for="usr">{{trans('forms.horario')}} <sup class="fa fa-asterisk req"></sup>:</label>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="bfh-timepicker" data-name="lavanderia_time_start" data-mode="12h"></div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="bfh-timepicker" data-name="lavanderia_time_end" data-mode="12h"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 p-0">
                                            <!-- Imagen -->
                                            <div class="col-sm-6">
                                                <br/>
                                                <label> {{ trans('forms.img') }} <sup class="fa fa-asterisk req"></sup>: </label>
                                                <input type="file" name="lavanderia_image" class="form-control">
                                            </div>
                                            <!-- Gallery -->
                                                <div class="row">
                                                    <div class="form-group col-sm-6" id="gallery_slides" style="top: 17px; width: 49%;">
                                                        <label class="control-label">{{ trans('forms.img_gallery') }} <sup class="fa fa-asterisk req"></sup>:</label>
                                                        <div id="gallery_images"></div>
                                                        <div class="input-group mb-2">
                                                            <input type="file" class="form-control slide-img"  name="gallery_img[]">
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-success add_image_gallery" type="button"><i class="fa fa-plus"></i></button>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="current_gallery_slides"></div>
                                                </div>  
                                                                                            
                                        </div>                                        
                               
                                
                            </div>
                        </div>
                          
                        <div class="row">
                        @foreach($idiomas as $key => $idioma)
                            <div class="col-md-6">
                                <div id="{{ $idioma->codigo }}" class="panel panel-default">
                                    <div class="panel-heading text-center">
                                        <strong class="text-info">{{$idioma->nombre}}</strong>
                                    </div>
                                    <div class="panel-body p-2">
                                        <!-- Nombre -->
                                        <div class="form-group col-sm-12">
                                            <label> {{ trans('lists.nombre')}} <sup class="fa fa-asterisk req"></sup>: </label>
                                            <input type="text" 
                                                   id="nameinput" 
                                                   class="form-control" 
                                                   name="lavanderia_name_{{$idioma->codigo}}" 
                                                   placeholder="{{ trans('lists.nombre')}}"
                                                   autocomplete="off" 
                                                   required>
                                            <input type="hidden" class="row_{{$idioma->codigo}}"name="languages[]" value="{{$idioma->codigo}}">
                                        </div>

                                        <!--Apertura-->
                                        <div class="form-group col-sm-12">
                                            <label> {{ trans('lists.dias')}} <sup class="fa fa-asterisk req"></sup>: </label>
                                            <input type="text"
                                                   id="nameinput"
                                                   class="form-control" 
                                                   name="lavanderia_apertura_{{$idioma->codigo}}" 
                                                   placeholder="{{trans('lists.diasapertura')}}"
                                                   autocomplete="off" 
                                                   required>
                                        </div>

                                        <!-- Descripción Corta -->
                                        <div class="form-group col-sm-12">
                                            <label>{{ trans('lists.desCorta') }} <sup class="fa fa-asterisk req"></sup>:</label>
                                            <textarea class="form-control" 
                                                      name="lavanderia_descorta_{{$idioma->codigo}}" 
                                                      placeholder="{{ trans('lists.desCorta') }}" 
                                                      rows="3"
                                                      autocomplete="off" 
                                                      required></textarea>
                                        </div>
                                        <!-- Descripción Larga -->
                                        <div class="form-group col-sm-12">
                                            <label>{{ trans('lists.desLarga') }}:</label>
                                            <textarea class="form-control" 
                                                      name="lavanderia_deslarga_{{$idioma->codigo}}" 
                                                      placeholder="{{ trans('lists.desLarga') }}"
                                                      autocomplete="off" 
                                                      rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        </div>
                        <div class="col-sm-12">
                            <small><sup class="fa fa-asterisk req"></sup> {{ trans('forms.required_fields')}}</small>
                        </div>
                </div>
                </div>
                <div class="modal-footer">
                    <div class="text-right">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" data-loading-text="Loading...">{{ trans('forms.guardar')}}</button>
                    </div>
                </div>
           </form>
        </div>
      </div>
    </div>

    <!--- Editar Lavanderia-->
    <div class="modal fade" id="edit_lavanderia_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg" style="width:1000px;" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">{{ trans('forms.update')}} {{ trans('lists.lavanderia')}}</h4>
            </div>
            <form id="frmUpdateLavanderia" enctype="multipart/form-data" method="post">

                    <input type="hidden" 
                           name="idLavanderia"
                           id="idLavanderia"
                           class="form-control">

                <div class="modal-body">
                    <div class="loading-body">
                        <!-- Loading content gif -->
                    </div>
                    <div class="row p-3">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <strong class="text-info">{{ trans('forms.generalinformacion')}}</strong>
                            </div>
                                <!-- carga la imagen de portada -->
                                <br/>
                                <div class="text-center col-sm-12">
                                    <img src="" class="img-responsive center-block imgshow" id="lavanderia_cover" style="width: 150px;margin: 0 auto;"/>
                                </div>
                            <div class="panel-body px-2 py-3">
                                <label class="p-4">{{ trans('forms.status') }}:</label>
                                <label style="margin-right: 20px;">
                                    <input type="radio" name="is_active" id="opt_yes" value="1"> {{ trans('forms.active') }}
                                </label>
                                <label>
                                    <input type="radio" name="is_active" id="opt_not" value="2"> {{ trans('forms.inactive') }}
                                </label> 
                                       
                                        <!-- Rango de horas -->
                                        <div class="col-sm-12">
                                            <br/>
                                            <label for="usr">{{trans('forms.horario')}} <sup class="fa fa-asterisk req"></sup>:</label>
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="bfh-timepicker" id="edit_lavanderia_time_start" data-name="edit_lavanderia_time_start" data-mode="12h"></div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="bfh-timepicker" id="edit_lavanderia_time_end" data-name="edit_lavanderia_time_end" data-mode="12h"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-sm-12 p-0">
                                            <!-- Imagen -->
                                            <div class="col-sm-6">
                                                <br/>
                                                <label> {{ trans('forms.img') }} <sup class="fa fa-asterisk req"></sup>: </label>
                                                <input type="file" name="edit_lavanderia_image" class="form-control">
                                            </div>
                                                       <!-- galeria -->
                                                    <div class="row">
                                                        <div class="form-group col-sm-6" id="gallery_slides_edit" style="top:17px;width: 49%;">
                                                            <label class="control-label">{{ trans('forms.img_gallery') }} <sup class="fa fa-asterisk req"></sup>:</label>
                                                            <div id="edit_gallery_images"></div>
                                                            <div class="input-group mb-2">
                                                                <input type="file" class="form-control slide-img"  name="edit_gallery_img[]">
                                                                <span class="input-group-btn">
                                                                    <button class="btn btn-success edit_add_image_gallery" type="button"><i class="fa fa-plus"></i></button>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" id="current_gallery_slides"></div>
                                                    </div>    
                                                    
                                                 <div class="form-group" id="current_experience_slides"></div>                                                        
                                        </div>                                        
                               
                                
                            </div>
                        </div>
                          
                        <div class="row">
                        @foreach($idiomas as  $idioma)
                            <div class="col-md-6">
                                <div id="{{ $idioma->codigo }}" class="panel panel-default">
                                    <div class="panel-heading text-center">
                                        <strong class="text-info">{{$idioma->nombre}}</strong>
                                    </div>
                                    <div class="panel-body p-2">
                                        <!-- Nombre -->
                                        <div class="form-group col-sm-12">
                                            <label> {{ trans('lists.nombre')}} <sup class="fa fa-asterisk req"></sup>: </label>
                                            <input type="text" 
                                                   id="edit_lavanderia_name_{{$idioma->codigo}}" 
                                                   class="form-control traduccion" 
                                                   name="edit_lavanderia_name_{{$idioma->codigo}}" 
                                                   placeholder="{{ trans('lists.nombre')}}"
                                                   autocomplete="off" 
                                                   required>
                                            <input type="hidden" class="row_{{$idioma->codigo}}"name="edit_languages[]" value="{{$idioma->codigo}}">
                                        </div>

                                        <!--Apertura-->
                                        <div class="form-group col-sm-12">
                                            <label> {{ trans('lists.dias')}} <sup class="fa fa-asterisk req"></sup>: </label>
                                            <input type="text"
                                                   id="edit_lavanderia_apertura_{{$idioma->codigo}}"
                                                   class="form-control traduccion" 
                                                   name="edit_lavanderia_apertura_{{$idioma->codigo}}" 
                                                   placeholder="{{trans('lists.diasapertura')}}"
                                                   autocomplete="off" 
                                                   required>                                               
                                        </div>

                                        <!-- Descripción Corta -->
                                        <div class="form-group col-sm-12">
                                            <label>{{ trans('lists.desCorta') }} <sup class="fa fa-asterisk req"></sup>:</label>
                                            <textarea class="form-control traduccion"
                                                      id="edit_lavanderia_descorta_{{$idioma->codigo}}" 
                                                      name="edit_lavanderia_descorta_{{$idioma->codigo}}" 
                                                      placeholder="{{ trans('lists.desCorta') }}" 
                                                      rows="3"
                                                      autocomplete="off" 
                                                      required></textarea>
                                        </div>
                                        <!-- Descripción Larga -->
                                        <div class="form-group col-sm-12">
                                            <label>{{ trans('lists.desLarga') }}:</label>
                                            <textarea class="form-control traduccion" 
                                                      id="edit_lavanderia_deslarga_{{$idioma->codigo}}" 
                                                      name="edit_lavanderia_deslarga_{{$idioma->codigo}}" 
                                                      placeholder="{{ trans('lists.desLarga') }}"
                                                      autocomplete="off" 
                                                      rows="3"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        </div>
                        <div class="col-sm-12">
                            <small><sup class="fa fa-asterisk req"></sup> {{ trans('forms.required_fields')}}</small>
                        </div>
                </div>
                </div>
                <div class="modal-footer">
                    <div class="text-right">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" data-loading-text="Loading...">{{ trans('forms.update')}}</button>
                    </div>
                </div>
           </form>
        </div>
      </div>
    </div>

        <!-- Modal para aumentar tamaño de imagen de galeria -->
    <div class="modal fade" id="detail_experience_modal" role="dialog" aria-labelledby="image_model_title">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 id="image_model_title" class="p-0 m-0"></h4>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <img alt="promotion-details" class="img-responsive" id="promotion_details_img">
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <span>
                        <button type="button" class="btn btn-info btn-flat-lg" data-dismiss="modal">{{ trans('forms.close') }}</button>
                    </span>
                </div>
            </div>
        </div>
    </div>

        <!-- Modal de confirmación ELIMINAR GALERIA-->
    <div class="modal fade" id="delete_galeria_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">{{ trans('forms.delete_img_title')}}</h4>
                </div>
                <form id="frmDeleteGaleria">
                    <div class="modal-body">
                        <h5 class="text-danger" id="extra-message"></h5>
                        <input type="hidden" id="delete_idLavanderia" class="form-control" name="delete_idLavanderia">
                        <h5>{{ trans('forms.delete_img_confirm')}}</h5>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('forms.cancelar')}}</button>
                        <button type="submit" class="btn btn-danger">{{ trans('forms.delete')}}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

        <!-- Modal de confirmacion ELIMINAR LAVANDERIA -->
    <div class="modal fade" id="confirm_delete_modal_lavanderia" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header flat">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title">{{ trans('lists.Delete')}}</h4>
                </div>
                <form method="post" id="frmDeleteLavanderia">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-sm-12 text-center">
                                <div id="delete-alert" class="alert flat" style="display:none">
                                    <div id="delete-alert-content"></div>
                                </div>
                            </div>
                        </div>
                        <h4 class="modal-title">{{ trans('lists.pregunta')}}</h4>
                        
                        <input type="hidden" 
                               id="del_idLavanderia" 
                               name="idLavanderia" 
                               class="form-control">

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">{{ trans('forms.cancelar') }}</button>
                        <button type="submit" class="btn btn-danger">{{ trans('forms.delete') }}</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

         <!-- Modal Extras -->
    <div class="modal fade" id="extra_modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" style="width:1000px;" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                    </button>
                    <h4 class="modal-title" id="myModalLabel">{{ trans('lists.Extra')}}</h4>
                </div>
                <form id="frmExtraLavanderia" enctype="multipart/form-data" method="post">
                    <div class="modal-body">
                        <div class="row p-3">

                            <input type="hidden" 
                                   name="extra_idLavanderia" 
                                   id="extra_idLavanderia">

                            <div class="col-sm-10 col-md-11">
                                <div class="row">
                                    @foreach($idiomas as $key => $idioma)
                                        <div class="form-group col-sm-6">
                                            <label> {{ trans('lists.Extra')}} - {{$idioma->nombre}} <sup class="fa fa-asterisk req"></sup>: </label>
                                            <input type="text" 
                                                   class="form-control extra_lang" 
                                                   name="lavanderia_exta_{{$idioma->codigo}}" 
                                                   placeholder="{{ trans('lists.nombre')}}"
                                                   autocomplete="off"
                                                   data-lang="{{$idioma->codigo}}"
                                                   data-idioma="{{$idioma->nombre}}">
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <div class="col-sm-2 col-md-1 pt-2 text-right" style="    right: 2%; top: 2px;">
                                <button type="button" class="btn btn-success mt-4" id="btn_extra_add">{{ trans('forms.add') }}</button>
                            </div>
                            <div class="col-sm-12">
                                <table class="table table-bordered table-custom">
                                    <thead>
                                        <tr class="info">
                                            <th width="270">{{ trans('lists.Extra')  }}</th>
                                            <th width="70">{{ trans('lists.language') }}</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-centered" id="includes_table">                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="text-right">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary" data-loading-text="Loading...">{{ trans('forms.save')}} {{ trans('lists.Extra')}}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>



@endsection