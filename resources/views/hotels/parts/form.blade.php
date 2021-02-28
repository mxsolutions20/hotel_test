<div id="notifications" style="display:none"></div>
<div class="modal-body">
    <form id="frmHotels" class="frmHotels">
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