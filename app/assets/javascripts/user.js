function userJuice() {
  $("#js-juice").on('click', function() {
    var $form = $(this);
    var id = $form.data("id");
    var values = $form.serialize();

    $.ajax({
      url: "/users/" + id + "/juices",
      data: values,
      action: "GET",
      dataType: 'json'
    }).success(function(data){
      $.each(data, function(index, juice) {
        $(".user-juices").append("<li>" + juice.name + "</li>");
      });
      $('#js-juice').hide();
    });
  });
}
