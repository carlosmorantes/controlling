$(function(){
  $.validate({
    validateOnBlur : true
  }); /*validate all forms*/
  $("#send-form").click(function() {
    var data = $('.amazon-form').serialize();
    $.ajax({
        url: "/amazon/update",
        type: "post",
        data : data
    }).done(function (data) {
        // Bei Erfolg
    }).fail(function() {
        // Bei Fehler
    }).always(function() {
        // Immer
    });
  });
});
