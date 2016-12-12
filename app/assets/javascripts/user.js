function userJuice() {
  $("#js-juice").on('click', function() {
    var id = $(this).data("id");
    $.get("/users/" + id + "/juices.json", function(data) {

      $.each(data, function(index, juice) {
        $(".user-juices").append("<li>" + juice.name + "</li>");
      });
      $('#js-juice').hide();
    });
  });
}
