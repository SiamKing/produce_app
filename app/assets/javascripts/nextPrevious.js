function previous() {
  $('.js-previous').on('click', function(e) {
    e.preventDefault();
    var prevId = $('.js-previous').attr("data-id") - 1;
    $.get('/produce/' + prevId + ".json", function(data) {
      var produce = data;
      $('.produceName').text(produce["name"]);
      $('img').attr("src", produce["image"]["image"]["large"]["url"]);
      $('.produceContent').text(produce["content"]);
      $('#expiresIn').text("Shelf life is usually about " + produce["expires_in"] + " days.");
      $('.button_to').attr('action', "/user_produce." + prevId);
      $('.editProduce').attr('href', '/produce/' + data["id"] + '/edit');
      $('.juiceLink').attr("href", "/produce/" + data["id"] + "/juices").text("Juices with " + produce["name"]);
      $('.js-previous').attr("data-id", data["id"]);
      $('.js-next').attr('data-id', data["id"]);
    });
  });
}
function next() {
  $('.js-next').on('click', function(e) {
    e.preventDefault();
    var nextId = parseInt($('.js-next').attr("data-id")) + 1;
    $.get('/produce/' + nextId + ".json", function(data) {
      var produce = data;
      $('.produceName').text(produce["name"]);
      $('img').attr("src", produce["image"]["image"]["large"]["url"]);
      $('.produceContent').text(produce["content"]);
      $('#expiresIn').text("Shelf life is usually about " + produce["expires_in"] + " days.");
      $('.button_to').attr('action', "/user_produce." + nextId);
      $('.editProduce').attr('href', '/produce/' + data["id"] + '/edit');
      $('.juiceLink').attr("href", "/produce/" + data["id"] + "/juices").text("Juices with " + produce["name"]);
      $('.js-previous').attr("data-id", data["id"]);
      $('.js-next').attr('data-id', data["id"]);
    });
  });
}
