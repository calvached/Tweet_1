$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  $('form').submit(function(event) {
    event.preventDefault();
    $.ajax({
      type: 'Post',
      url: '/get_user_tweets',
      data: ,
      success: function(response) {
        window.location.href = '/' + ;
      }
    })
  })
});
