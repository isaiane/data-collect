function updateMultiple() {
	var form =  $("#update_multiple");
  var timer = null;
  $("input").keyup(function(event) {
    event.preventDefault();
    var element = $(this);
    clearTimeout(timer);
    timer = setTimeout(function() {
      $(form).submit();
    }, 1000)
  });
  $(form).submit(function(event) {
    $.post(this.action, $(this).serialize(), null, "script");
    return false;
  });
}