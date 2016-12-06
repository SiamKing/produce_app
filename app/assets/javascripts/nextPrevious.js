function previous() {
  $('body').on('click', '.js-previous', function(e) {
    e.preventDefault();
    alertClear();
    $('.js-next').show();
    var id = $('.js-previous').attr("data-id") - 1;
    var element = this;
    juiceOrProduce(id, element)
  });
}

function next() {
  $('body').on('click', '.js-next', function(e) {
    e.preventDefault();
    alertClear();
    $('.js-previous').show();
    var element = this;
    var id = parseInt($(element).attr("data-id")) + 1;
    juiceOrProduce(id, element);
  });
}

function juiceOrProduce(id, element) {
  var element = element;
  var id = id;
  if (id - 1 === parseInt($(element).attr("last-id") ) || id <= 0) {
    $(element).hide();
    alert("That was the last item...");
  } else {
    if ($(element).html() === "Next Juice" || $(element).html() === "Previous Juice") {
      juiceAJAX(id, element);
    } else {
      produceAJAX(id, element);
    }
  }
}

function alertClear() {
  $(".alert").empty().attr("class", "");
}

function juiceAJAX(id, element) {
  $.get('/juices/' + id + ".json", function(data) {
    var juice = data
    Juice.getAjax(juice);

    $('.comments').empty();
    $('#comment_juice_id').val(juice.id);
    $.each(juice.comments, function(index, comment) {
      Comment.success(comment);
    });
  }).fail(function(error) {
    thereIsAnError(id, element);
  });
}

Juice.getAjax  = function(juice) {
  $('.juice-show').html('');
  Juice.templateSource = $("#juice-produce-template").html();
  Juice.template = Handlebars.compile(Juice.templateSource);
  var juices = new Juice(juice);
  var juicesHTML = juices.renderHTML();
  $('.juice-show').html(juicesHTML);
}

Juice.prototype.renderHTML = function() {
  return Juice.template(this);
}

function Juice(attr) {
  this.name = attr.name;
  this.id = attr.id;
  this.userId = attr.user_id;
  this.userName = attr.user.name;
  this.juiceProduce = attr.produce.map(function(prod, index) {
                          var produce = {
                            id: prod.id,
                            name: prod.name,
                            image: prod.image.image.thumb.url,
                            alt: prod.image.name,
                            quantity: attr.juice_produce[index].quantity
                          }
                          return produce
                       });

}

Handlebars.registerHelper("debug", function(optionalValue) {
  console.log("Current Context");
  console.log("====================");
  console.log(this);

  if (optionalValue) {
    console.log("Value");
    console.log("====================");
    console.log(optionalValue);
  }
});

function Produce(attributes) {
  this.name = attributes.name;
  this.id = attributes.id;
  this.image = attributes.image.image.large.url;
  this.content = attributes.content;
  this.shelfLife = attributes.expires_in;
}

Produce.prototype.renderHTML = function() {
  return Produce.template(this);
}

function produceAJAX(id, element) {
  $.get('/produce/' + id + ".json", function(json) {
    Produce.templateSource = $("#nextPrevProduce-template").html();
    Produce.template = Handlebars.compile(Produce.templateSource);
    $('.produceBody').html('');
    var produce = new Produce(json);
    var produceHTML = produce.renderHTML();

    $('.produceBody').html(produceHTML);
  })
  .fail(function(error) {
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

// function juiceAJAX(id, element) {
//   $.get('/juices/' + id + ".json", function(data) {
//     var juice = data
//     $('.comments').empty();
//     $('#comment_juice_id').val(juice.id);
//     $.each(juice.comments, function(index, comment) {
//       Comment.success(comment);
//     });
//     $('.jumbo-header').text(juice.name);
//     $('.juice-produce').empty();
//     $.each(juice.juice_produce, function(index, jp) {
//       var content = '<div class="col-xs-4 col-centered">';
//       content += '<h3 align="center" class="produceQuantity">' + jp.quantity + " " + juice.produce[index].name + '</h3>';
//       content += '<div class="produce-index-img text-center">';
//       content += '<a href="/produce/' + juice.produce[index].id + '"><img src=' + juice.produce[index].image.image.thumb.url + '></a>';
//       content += '</div>';
//       content += '</div>';
//       $('.juice-produce').append(content);
//     });
//     $('.editJuice').attr('href', "/juices/" + juice.id + "/edit");
//     $('.userJuice').attr('href', "/users/" + juice.user_id + "/juices").text("Created by " + juice.user.name);
//     $('.deleteJuice').attr('href', '/juices/' + juice.id);
//     $('.js-previous').attr("data-id", juice["id"]);
//     $('.js-next').attr('data-id', juice["id"]);
//
//     if ($('.js-next').attr("data-id") === $('.js-next').attr("last-id")) {
//       $('.js-next').hide();
//     }
//     if ($('.js-previous').attr("data-id") === "1") {
//       $('.js-previous').hide();
//     }
//   }).fail(function(error) {
//     thereIsAnError(id, element);
//   });
// }
