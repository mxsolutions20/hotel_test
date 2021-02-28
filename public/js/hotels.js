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
                + '<td> <strong class=""text-success">' + response.data.htmTxtActive + '</strong></td>'
                + '<td><button type="button" class="btn btn-link btn_delete" id="btn_delete" data_id="' + response.data.idHotel + '">' + response.htmTxtDelete + '</button></td>'
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

$("#result_data").on('click', '.btn_delete', function (e) {

    e.preventDefault();
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

    var data_id = $(this).attr('data_id');
    var element = $(this).parent().parent().remove();

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

            $("#alerts_notifications").fadeOut(900, "linear");

        } else {
            $("#alerts_notifications").empty();
            $("#alerts_notifications").show();

            $.each(data.errors, function (key, value) {
                htm = '<div class="alert alert-danger" role="alert">' + value + '</div>';
                $("#alerts_notifications").append(htm);
            })
            $("#alerts_notifications").fadeOut(9000, "linear");

        }

    })

    request.fail(function (jqXHR, textStatus, errorThrown) {

        console.log(errorThrown);
    })

    request.always(function (jqXHR, textStatus, errorThrown) {
        //console.log(errorThrown);
    })

})