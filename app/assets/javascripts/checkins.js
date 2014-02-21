$(function () {
    
    if (geoPosition.init()) $('#geoLocationYes').removeClass('hide');
    else $('#geoLocationNo').removeClass('hide');

    function success_callback(o) {
        console.log(o);
        $('#checkin_latitude').val(o.coords.latitude);
        $('#checkin_longitude').val(o.coords.longitude);
        $('#checkin_accuracy').val(o.coords.accuracy);
    }

    $('#checkin').click(function(e) {
        $('#geoLocationYes').addClass('hide');
        var l = Ladda.create(this);
        l.start();
        geoPosition.getCurrentPosition(function (o) {
            $('#checkin_latitude').val(o.coords.latitude);
            $('#checkin_longitude').val(o.coords.longitude);
            $('#checkin_accuracy').val(o.coords.accuracy);
            $('#new_checkin').submit();
            l.stop();
        }, 
            function error_callback(e) {
            //e.code PERMISSION_DENIED: 1
            //e.code  POSITION_UNAVAILABLE: 2
            //e.code  TIMEOUT: 3
            $('#geoLocationNo').text(e.message);
            $('#geoLocationNo').removeClass('hide');    
            console.log(e);
        }, 
        {
                enableHighAccuracy: true,
                maximumAge: 10000 //10secs
        });
    });

    $('#new_checkin').on('ajax:success',function (event, checkin, status) {
        $('#geoLocationYes').text('You were checked in at : '+checkin.address);
        $('#geoLocationYes').removeClass('hide');
    });    

    $('#new_checkin').on('ajax:error',function (event, error, status) {
        $('#geoLocationNo').text('Something went wrong :( Could not check you in');
        $('#geoLocationNo').removeClass('hide');
    });    
});


