var Rooms = {
    initialize: function(){
        console.log('Rooms started');
        this.handleOpenModals();
        this.handleSubmitForms();
    },

    handleOpenModals: function(){
        let _this = this;

        $(".selectdos").select2();

        $(".select-wine-list").select2({ dropdownParent: $("#new_winesales_modal") });
        $(".edit-select-wine-list").select2({ dropdownParent: $(".content-box-large") });
        // Handle modal new service form modal
        $('#create_room').click(function(event) {
            event.preventDefault();

            $('#new_room_modal').modal('show');
        });

        // Handle update service form modal
        $('.edit_room').on('click', function(event) {
            event.preventDefault();
            $('#edit_room_gazebo').val('');

            $.ajax({
                url: _root_ + "rooms/edit_room",
                headers: { 'X-CSRF-TOKEN': $('input[name=_token]').val() },
                data: { idRoom : $(this).data('room') },
                type: 'POST',
                datatype: 'JSON'
            })
            .done(function(response){
                if (!response.error) {
                    let habitacion = response.room;
                    $('#edit_idRoom').val(habitacion.idHabitacion);
                    $('#edit_room_name').val(habitacion.nombre);
                    $('#edit_room_type option[value="'+habitacion.idTipoHabitacion+'"]').prop('selected', true);
                    if (habitacion.gazebo !== null) {
                        $('#edit_room_gazebo option[value="'+habitacion.gazebo.idGazebo+'"]').prop('selected', true);
                    }

                    if(habitacion.estatus == 1){
                        $("#opt_yes").prop("checked",true);
                    }else{
                        $("#opt_not").prop("checked",true);
                    }

                    $('#edit_room_modal').modal('show');
                } else {
                    $('#concierge_table').hide();
                    if(typeof response.message === 'object'){
                        $.each(response.message, function(i, message){ alertify.error(message); });
                    } else {
                        alertify.error(response.message);
                    }
                }

            })
            .fail(function(errno){
                alertify.error('Error-' + errno.status + ': ' + errno.statusText);
            });
        });

        // Handle delete service form modal
        $('.delete_room').on('click', function(event) {
            event.preventDefault();
            $('#delete_idRoom').val($(this).data('room'));
            $('#delete_room_modal').modal('show');
        });
    },

    handleSubmitForms: function(){
        let _this = this;

        $('#frmNewRoom').validator().on('submit', function(event) {
            event.preventDefault();
            $('#new_form').hide();
            $('#new_loading').html('<img src="'+_wait_+'" alt="loading.." height="150" width="150">');

            _this.submitRoomInstance($('#frmNewRoom').serialize(), 'rooms/store_room', '#new_form', '#new_loading');
        });

        $('#frmUpdateRoom').validator().on('submit', function(event) {
            event.preventDefault();
            $('#edit_form').hide();
            $('#edit_loading').html('<img src="'+_wait_+'" alt="loading.." height="150" width="150">');
            _this.submitRoomInstance($('#frmUpdateRoom').serialize(), 'rooms/update_room', '#edit_form', '#edit_loading');
        });

        $('#frmDeleteRoom').validator().on('submit', function(event) {
            event.preventDefault();
            $('#delete_form').hide();
            $('#delete_loading').html('<img src="'+_wait_+'" alt="loading.." height="150" width="150">');
            _this.submitRoomInstance($('#frmDeleteRoom').serialize(), 'rooms/destroy_room', '#delete_form', '#delete_loading');
        });
    },


    submitRoomInstance: function(data, _url, _form, _loader){
        $.ajax({
            url: _root_ + _url,
            headers: { 'X-CSRF-TOKEN': $('input[name=_token]').val() },
            data: data,
            type: 'POST',
            datatype: 'JSON'
        })
        .done(function(response){
            if (response.error) {
                if(typeof response.message === 'object'){
                    $.each(response.message, function(i, message){ alertify.error(message); });
                } else {
                    alertify.error(response.message);
                }
                $(_loader).hide();
                $(_form).show();
            } else {
                alertify.success(response.message);
                setTimeout(function(){
                    location.reload(true);
                }, 750);
            }               
        })
        .fail(function(errno){
            alertify.error('Error-' + errno.status + ': ' + errno.statusText);
            $(_loader).hide();
            $(_form).show();
        });
    },
}

$(document).ready(function() {
    Rooms.initialize();
});