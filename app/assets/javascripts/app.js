//for Notice and Alert to fade away
$(document).on('turbolinks:load', function() {
 $(".alert").delay(2000).fadeOut(800);
});

