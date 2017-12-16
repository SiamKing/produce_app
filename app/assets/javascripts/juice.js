function Juice(attr) {
  this.name = attr.name;
  this.id = attr.id;
  this.userId = attr.user_id;
  this.userName = attr.user.name;
  this.juiceProduce = attr.produce.map(function(item, index) {
      return {
        id: item.id,
        name: item.name,
        image: item.image.image.thumb.url,
        alt: item.image.name,
        quantity: attr.juice_produce[index].quantity
      }
   });

}

Juice.format  = function(juice) {
  $('.juice-show-page').empty();
  Juice.templateSource = $("#juice-produce-template").html();
  Juice.template = Handlebars.compile(Juice.templateSource);
  var juices = new Juice(juice);
  var juicesHTML = juices.renderHTML();
  $('.juice-show-page').html(juicesHTML);
}

Juice.prototype.renderHTML = function() {
  return Juice.template(this);
}

function juiceAJAX(id, element) {
  $.get('/juices/' + id + ".json", function(data) {
    var juice = data;
    Juice.format(juice);

    $('.comments').empty();
    $('#comment_juice_id').val(juice.id);
    $.each(juice.comments, function(index, comment) {
      Comment.success(comment);
    });
  }).fail(function(error) {
    thereIsAnError(id, element);
  });
}
