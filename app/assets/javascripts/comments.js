function Comment(attributes) {
  this.userName = attributes.user.name;
  this.userId = attributes.user_id;
  this.commentContent = attributes.content;
  this.email = MD5(attributes.user.email);
  this.formattedDate = commentDate(attributes.created_at);
}

Comment.ready = function() {
  Comment.templateSource = $("#comment-template").html();
  Comment.template = Handlebars.compile(Comment.templateSource);
  Comment.formSubmitListener();
}

Comment.prototype.renderHTML = function() {
  return Comment.template(this);
}

Comment.success = function(data) {
  $('.comment-area').val('');
  $('.js-formSubmit').removeAttr('disabled').attr('value', 'Create Comment');
  var comment = new Comment(data);
  var commentHTML = comment.renderHTML();
  $('.comments').append(commentHTML);
}

Comment.error = function(error) {
  $('.js-formSubmit').removeAttr('disabled').attr('value', 'Create Comment');
  $(".alert").attr("class", "alert").val("There was an error, please try again");
}

Comment.formSubmitListener = function() {
  $('form').on('submit', Comment.formSubmit)
}

Comment.formSubmit = function(e) {
  e.preventDefault();
  var $form = $(this);
  $form.find(".error").html("");
  if ($('.comment-area').val() === '') {
    $form.find('.js-formSubmit').removeAttr('data-disable-with');
    $form.find(".error").html("Please make a comment");
  } else {
    var action = $form.attr("action")
    var values = $form.serialize();
    $.ajax({
      url: action,
      data: values,
      dataType: "json",
      method: "POST"
    })
    .success(Comment.success)
    .error(Comment.error)
  }
}

function commentDate(date) {
  var commentDate = new Date(date);
  var month = ["Jan", "Feb", "March", "April", "May", "June",
  "July", "Aug", "Sept", "Oct", "Nov", "Dec"][commentDate.getMonth()];
  var formattedDate = month + ' ' + commentDate.getDate() + ', '+ commentDate.getFullYear();
  return formattedDate;
}

// function commentAppend(data) {
//   var comment = data;
//   var email = MD5(comment.user.email);
//   var userId = comment.user_id;
//   var userName = comment.user.name;
//   var commentContent = comment.content;
//
//   var html = '<div class="row">';
//   html += '<div class="col-sm-8 col-sm-offset-2">';
//   html += '<div class="panel panel-white post panel-shadow">';
//   html += '<div class="post-heading">';
//   html += '<div class="pull-left image">';
//   html += '<img src="http://www.gravatar.com/avatar/' + email + '" class="img-circle avatar" alt="Gravatar">';
//   html += '</div>';
//   html += '<div class="pull-left meta">';
//   html += '<div class="title h5">';
//   html += '<a href="/users."' + userId + '">' + userName + ' commented on</a>';
//   html += '</div>';
//   html += '<h6 class="text-muted time">' + formattedDate + '</h6>';
//   html += '</div>';
//   html += '</div>';
//   html += '<br>';
//   html += '<div class="post-description">';
//   html += '<p>' + commentContent + '</p>';
//   html += '</div>';
//   html += '</div>';
//   html += '</div>';
//   html += '</div>';
//   return html;
// }
