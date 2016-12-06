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
