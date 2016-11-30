function previous() {
  $('.js-previous').on('click', function(e) {
    e.preventDefault();
    $('.js-next').show();
    if ($('.js-previous').attr("data-id") === "1") {
      $('.js-previous').hide();
      alert("That is the first item...click next to go the other way");
    } else {
      $('.js-previous').show();
      var element = this;
      var id = $('.js-previous').attr("data-id") - 1;
      if ($(this).html() === "Previous Juice" || $(this).html() ==="Next Juice") {
        juiceAJAX(id, element);
      } else {
        produceAJAX(id, element);
      }
    }
  });
}
function next() {
  $('.js-next').on('click', function(e) {
    e.preventDefault();
    $('.js-previous').show();
    if ($('.js-next').attr("data-id") === $('.js-next').attr("last-id")) {
      $('.js-next').hide();
      alert("That was the final item...please click previous to go the other way");
    } else {
      var element = this;
      var id = parseInt($('.js-next').attr("data-id")) + 1;
      if ($(this).html() === "Previous Juice" || $(this).html() ==="Next Juice") {
        juiceAJAX(id, element);
      } else {
        produceAJAX(id, element);
      }
    }
  });
}

function juiceAJAX(id, element) {
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
    console.log(juice);
    $('.comments').empty();
    if (juice.comments !== []) {
      $.each(juice.comments, function(index, comment) {
        commentAppend(comment);
      });
    }
    if ($('.js-next').attr("data-id") === $('.js-next').attr("last-id")) {
      $('.js-next').hide();
    }
    if ($('.js-previous').attr("data-id") === "1") {
      $('.js-previous').hide();
    }
  }).fail(function(error) {
    thereIsAnError(id, element);
  });
}

function produceAJAX(id, element) {
  $.get('/produce/' + id + ".json", function(data) {
    var produce = data;
    $('.produceName').text(produce["name"]);
    $('img').attr("src", produce["image"]["image"]["large"]["url"]);
    $('.produceContent').text(produce["content"]);
    $('#expiresIn').text("Shelf life is usually about " + produce["expires_in"] + " days.");
    $('.addFridge').attr('action', "/user_produce." + id);
    $('.editProduce').attr('href', '/produce/' + produce["id"] + '/edit');
    $('.juiceLink').attr("href", "/produce/" + produce["id"] + "/juices").text("Juices with " + produce["name"]);
    $('.js-previous').attr("data-id", produce["id"]);
    $('.js-next').attr('data-id', produce["id"]);
    if ($('.js-next').attr("data-id") === $('.js-next').attr("last-id")) {
      $('.js-next').hide();
    }
    if ($('.js-previous').attr("data-id") === "1") {
      $('.js-previous').hide();
    }
  }).fail(function(error) {
    thereIsAnError(id, element);
  });
}

function thereIsAnError(id, element) {
  if (element.className === "js-next") {
    $('.js-previous').attr("data-id", id + 1);
    $('.js-next').attr('data-id', id + 1);
    alert("Sorry...that item does not exist");
  } else {
    $('.js-previous').attr("data-id", id - 1);
    $('.js-next').attr('data-id', id - 1);
    alert("Sorry...that item does not exist");
  }
}
