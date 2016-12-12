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

Juice.format  = function(juice) {
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
