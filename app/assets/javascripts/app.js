//for Notice and Alert to fade away
$(document).on('turbolinks:load', function() {
 $(".alert").delay(2200).fadeOut(1000);
});

