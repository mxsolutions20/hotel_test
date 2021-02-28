//Action add
$("#btn_save").on('click', function (e) {
    e.preventDefault();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var frmData = $("#frmHotels").serialize();
    console.log(frmData);

    var request = $.ajax({
        url: _root_ + "hotels/hotel-save",
        data: frmData,
        type: "POST",
        dataType: "json"
    })

    request.done(function (response, textStatus, jqXHR) {
        console.log(response);

        $("#notifications").empty();
        $("#notifications").hide();
        if ($.isEmptyObject(response.errors)) {
            $("#notifications").empty();
            $("#notifications").show();
            $.each(response.messages, function (key, value) {
                htm = '<div class="alert alert-success" role="alert">' + value + '</div>';
                $("#notifications").append(htm);
            })

            var tr_row = '<tr row_data_id="' + response.data.idHotel + '" >'
                + '<td>' + response.data.idHotel + '</td>'
                + '<td>' + response.data.nombre + '</td>'
                + '<td>' + response.data.direccion + '</td>'
                + '<td>' + response.data.telefono + '</td>'
                + '<td> <strong class="text-success">' + response.htmTxtActive + '</strong></td>'
                + '<td><button type="button" class="btn btn-link btn_delete" id="btn_delete" data_id="' + response.data.idHotel + '">' + response.htmTxtDelete + '</button>'
                +' <button type="button" class="btn btn-link btn_edit" id="btn_edit" data_id="' + response.data.idHotel + '">' + response.htmTxtEdit + '</button></td>'
                + '</tr>';

            $("#result_data").append(tr_row);


            $("#notifications").fadeOut(750, "linear");
            $("#frmHotels").trigger("reset");

        } else {
            $("#notifications").empty();
            $("#notifications").show();

            $.each(data.errors, function (key, value) {
                htm = '<div class="alert alert-danger" role="alert">' + value + '</div>';
                $("#notifications").append(htm);
            })
            $("#notifications").fadeOut(9000, "linear");
        }
    })

    request.fail(function (jqXHR, textStatus, errorThrown) {

        console.log(errorThrown);
    })

    request.always(function (jqXHR, textStatus, errorThrown) {
        //console.log(errorThrown);
    })
})

//Action delete
$("#result_data").on('click', '.btn_delete', function (e) {

    e.preventDefault();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var data_id = $(this).attr('data_id');
    var element = $(this).parent().parent();

    var request = $.ajax({
        url: _root_ + "hotels/" + data_id,
        data: { "id": data_id },
        type: "DELETE",
        dataType: "json"
    })

    request.done(function (data, textStatus, jqXHR) {

        $("#alerts_notifications").empty();
        $("#alerts_notifications").hide();
        if ($.isEmptyObject(data.errors)) {
            //console.log(data);
            $("#alerts_notifications").empty();
            $("#alerts_notifications").show();
            $(this).remove();
            element.remove();

            $.each(data.messages, function (key, value) {
                htm = '<div class="alert alert-success" role="alert">' + value + '</div>';
                $("#alerts_notifications").append(htm);
            })

            $("#alerts_notifications").fadeOut(4000, "linear");

        } else {
            $("#alerts_notifications").empty();
            $("#alerts_notifications").show();

            $.each(data.errors, function (key, value) {
                htm = '<div class="alert alert-danger" role="alert">' + value + '</div>';
                $("#alerts_notifications").append(htm);
            })
            $("#alerts_notifications").fadeOut(7000, "linear");

        }

    })

    request.fail(function (jqXHR, textStatus, errorThrown) {

        console.log(errorThrown);
    })

    request.always(function (jqXHR, textStatus, errorThrown) {
        //console.log(errorThrown);
    })

})

// Action edit
$("#result_data").on('click', '.btn_edit', function (e) {
    e.preventDefault();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var data_id = $(this).attr('data_id');

    var request = $.ajax({
        url: _root_ + "hotels/" + data_id + '/edit',
        data: { "id": data_id },
        type: "get",
        dataType: "json"
    })

    request.done(function (response, textStatus, jqXHR) {

        if ($.isEmptyObject(response.errors)) {

            $('#modal_edit_item').modal({
                show: 'true'
            });

            //console.log(response);
            var item = $('#modal_edit_item').find("#frmHotelsEdit")
            
            if ($('#modal_edit_item').data('bs.modal').isShown) {
                $("#frmHotelsEdit").trigger("reset");
                $(item).find("#idElement").val(response.data.idHotel)
                $(item).find("#name").val(response.data.nombre)
                $(item).find("#street").val(response.data.direccion)
                $(item).find("#phone").val(response.data.telefono)
            }

        }
    })

})

//Action update
$("#btn_update").on('click', function (e) {
    e.preventDefault();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });


    var item = $('#modal_edit_item').find("#frmHotelsEdit")
    var data_id = $(item).find("#idElement").val()
    var element = $('[row_data_id=' + data_id + ']')
    
    var frmData = $("#frmHotelsEdit").serialize();
    //console.log(frmData);

    var request = $.ajax({
        url: _root_ + "hotels/hotel-update",
        data: frmData,
        type: "POST",
        dataType: "json"
    })

    request.done(function (response, textStatus, jqXHR) {
    
        $("#notifications_edit").empty();
        $("#notifications_edit").hide();
        if ($.isEmptyObject(response.errors)) {
            $("#notifications_edit").empty();
            $("#notifications_edit").show();
            $.each(response.messages, function (key, value) {
                htm = '<div class="alert alert-success" role="alert">' + value + '</div>';
                $("#notifications_edit").append(htm);
            })

            $(element).html('');

            var tr_row = '<td>' + response.data.idHotel + '</td>'
                + '<td>' + response.data.nombre + '</td>'
                + '<td>' + response.data.direccion + '</td>'
                + '<td>' + response.data.telefono + '</td>'
                + '<td> <strong class="text-success">' + response.htmTxtActive + '</strong></td>'
                + '<td><button type="button" class="btn btn-link btn_delete" id="btn_delete" data_id="' + response.data.idHotel + '">' + response.htmTxtDelete + '</button>'
                +' <button type="button" class="btn btn-link btn_edit" id="btn_edit" data_id="' + response.data.idHotel + '">' + response.htmTxtEdit + '</button></td>';


            $(element).append(tr_row);


            $("#notifications_edit").fadeOut(750, "linear");
            //$("#frmHotels").trigger("reset");

        } else {
            $("#notifications_edit").empty();
            $("#notifications_edit").show();

            $.each(data.errors, function (key, value) {
                htm = '<div class="alert alert-danger" role="alert">' + value + '</div>';
                $("#notifications_edit").append(htm);
            })
            $("#notifications_edit").fadeOut(9000, "linear");
        }
    })

    request.fail(function (jqXHR, textStatus, errorThrown) {

        console.log(errorThrown);
    })

    request.always(function (jqXHR, textStatus, errorThrown) {
        //console.log(errorThrown);
    })

})
