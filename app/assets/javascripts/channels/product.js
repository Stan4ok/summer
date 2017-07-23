App.product = App.cable.subscriptions.create("ProductChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    $(".comm_alert .alert").show('Drop');
    $(".comm_alert .alert").delay(5000).fadeOut(2050);
    $('.product_reviews').prepend(data.comment);
    $("#average-rating").attr('data-score', data.average_rating);
    refreshRating();
  },

  listen_to_comments: function(){
    //As long as you're inside the object of the create() function, you can also simply refer to App.product as this.
    return this.perform('listen', { 
      product_id: $("[data-product-id]").data("product-id")
    });
  }
});

$(document).on('turbolinks:load', function() {
  App.product.listen_to_comments();
});