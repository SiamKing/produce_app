function previous() {
  $('.js-previous').on('click', function(e) {
    e.preventDefault();
    console.log($('.js-previous').attr("data-id") === "1");
    if ($('.js-previous').attr("data-id") === "1") {
      $('.js-previous').hide();
      alert("That is the first item...click next to go the other way");
    } else {
      $('.js-previous').show();
      var id = $('.js-previous').attr("data-id") - 1;
      if ($(this).html() === "Previous Juice" || $(this).html() ==="Next Juice") {
        juiceAJAX(id);
      } else {
        produceAJAX(id);
      }
    }
  });
}
function next() {
  $('.js-next').on('click', function(e) {
    $('.js-previous').show();
    var click = this;
    e.preventDefault();
    var id = parseInt($('.js-next').attr("data-id")) + 1;
    if ($(this).html() === "Previous Juice" || $(this).html() ==="Next Juice") {
      juiceAJAX(id, click);
    } else {
      produceAJAX(id, click);
    }
  });
}

function juiceAJAX(id, click) {
  $.get('/juices/' + id + ".json", function(data) {
    var juice = data
    $('.jumbo-header').text(juice.name);
    $('.juice-produce').empty();
    $.each(juice.juice_produce, function(index, jp) {
      var content = '<div class="col-xs-4 col-centered">';
      content += '<h3 align="center" class="produceQuantity">' + jp.quantity + " " + juice.produce[index].name + '</h3>';
      content += '<div class="produce-index-img text-center">';
      content += '<a href="/produce/' + juice.produce[index].id + '"><img src=' + juice.produce[index].image.image.thumb.url + '></a>';
      content += '</div>';
      content += '</div>';
      $('.juice-produce').append(content);
    });
    $('.editJuice').attr('href', "/juices/" + juice.id + "/edit");
    $('.userJuice').attr('href', "/users/" + juice.user_id + "/juices").text("Created by " + juice.user.name);
    $('.deleteJuice').attr('href', '/juices/' + juice.id);
    $('.js-previous').attr("data-id", juice["id"]);
    $('.js-next').attr('data-id', juice["id"]);
  }).fail(function(error) {
    if (click.className === "js-next") {
      $('.js-previous').attr("data-id", id + 1);
      $('.js-next').attr('data-id', id + 1);
      alert("Sorry...that item does not exist")
    } else {
      $('.js-previous').attr("data-id", id - 1);
      $('.js-next').attr('data-id', id - 1);
      alert("Sorry...that item does not exist");
    }
  });
}

function produceAJAX(id, click) {
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
  }).fail(function(error) {
    if (click.className === "js-next") {
      $('.js-previous').attr("data-id", data["id"] + 1);
      $('.js-next').attr('data-id', data["id"] + 1);
      alert("Sorry...that item does not exist")
    } else {
      $('.js-previous').attr("data-id", data["id"] - 1);
      $('.js-next').attr('data-id', data["id"] - 1);
      alert("Sorry...that item does not exist");
    }
  });
}
