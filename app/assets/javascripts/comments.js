function comment() {
  $('.form').on('click', 'submit', function(e) {
    e.preventDefault();
    console.log(this);
  })
}
