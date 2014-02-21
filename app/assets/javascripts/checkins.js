$(function () {
    
    if (geoPosition.init()) $('#geoLocationYes').removeClass('hide');
    else $('#geoLocationNo').removeClass('hide');

    function success_callback(o) {
        console.log(o);
    }

    function error_callback(e) {
        console.log(e);
    }
    

    $('#new_checkin').on('ajax:before', function(event, xhr, status) {

    geoPosition.getCurrentPosition(success_callback, error_callback, {
        enableHighAccuracy: true
    });
      event.preventDefault();
    });
});


