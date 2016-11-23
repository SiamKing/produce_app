function previous() {
  $('.js-previous').on('click', function(e) {
    e.preventDefault();
    var id = $('.js-previous').attr("data-id") - 1;
    produceAJAX(id);
  });
}
function next() {
  $('.js-next').on('click', function(e) {
    e.preventDefault();
    var id = parseInt($('.js-next').attr("data-id")) + 1;
    produceAJAX(id);
  });
}

function produceAJAX(id) {
  $.get('/produce/' + id + ".json", function(data) {
    var produce = data;
    $('.produceName').text(produce["name"]);
    $('img').attr("src", produce["image"]["image"]["large"]["url"]);
    $('.produceContent').text(produce["content"]);
    $('#expiresIn').text("Shelf life is usually about " + produce["expires_in"] + " days.");
    $('.button_to').attr('action', "/user_produce." + id);
    $('.editProduce').attr('href', '/produce/' + data["id"] + '/edit');
    $('.juiceLink').attr("href", "/produce/" + data["id"] + "/juices").text("Juices with " + produce["name"]);
    $('.js-previous').attr("data-id", data["id"]);
    $('.js-next').attr('data-id', data["id"]);
  });
}
