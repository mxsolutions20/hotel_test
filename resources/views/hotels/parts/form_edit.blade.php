<div class="modal fade" id="modal_edit_item" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">{{trans('forms.edit')}}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div id="notifications_edit" style="display:none"></div>
            <div class="modal-body">
                <form id="frmHotelsEdit">
                    <input type="text" id="idElement" name="idElement" style="display: none;"/>
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
                </form>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">{{trans('forms.close')}}</button>
                <button type="button" class="btn btn-primary" id="btn_update">{{trans('forms.update')}}</button>
            </div>
        </div>
    </div>
</div>