function comment() {
  $('form').on('submit', function(e) {
    e.preventDefault();

    var values = $(this).serialize();
    var comment = $(".comment-area").val();
    var juice_id = $("#juice_id").val();
    var user_id = $("#user_id").val();
    var thissy = $(this);

    var commentPost = $.post('/comments', values);

    commentPost.done(function(data) {
      console.log(data);
      var comment = data["content"];
      var html = '<div class="row">';
          html += '<div class="col-sm-8 col-sm-offset-2">';
          html += '<div class="panel panel-white post panel-shadow">';
          html += '<div class="post-heading">';
          html += '<div class="pull-left image">';
          html += '<img src="<%= h(gravatar_url("' + data.user.email + '")) %>" class="img-circle avatar" alt="Gravatar">';
          html += '</div>';
          html += '<div class="pull-left meta">';
          html += '<div class="title h5">';
          html += '<a href="/users."' + data.user_id + '">' + data.user.name + '</a>';
          html += '</div>';
          html += '<h6 class="text-muted time"><%= ((Time.now - comment.created_at.to_time) / 1.day).to_i %> day ago</h6>';
          html += '</div>';
          html += '</div>';
          html += '<br>';
          html += '<div class="post-description">';
          html += '<p>' + data.content + '</p>';
          html += '</div>';
          html += '</div>';
          html += '</div>';
          html += '</div>';
          $('.comments').append(html);
    });
    // $.ajax({
    //   url: '/comments/create',
    //   data: comment,
    //   type: "POST",
    //   success: function(data)
    // });
  });
}
