$(document).ready(function() {
	newDropDown();
	callModal();
	searchOptions();
	bgVideo();
	maskInput();
	userAccountAndProfile();
	updateMultiple();

	$(".auto-favorite").click(function(event) {
		event.preventDefault();
		$(this).toggleClass('active');
	});
  $('[data-toggle="tooltip"]').tooltip();

  toastr.options = {
	  "closeButton": true,
	  "debug": false,
	  "newestOnTop": false,
	  "progressBar": false,
	  "positionClass": "toast-bottom-right",
	  "preventDuplicates": false,
	  "onclick": null,
	  "showDuration": "1000",
	  "hideDuration": "1000",
	  "timeOut": "5000",
	  "extendedTimeOut": "1000",
	  "showEasing": "swing",
	  "hideEasing": "linear",
	  "showMethod": "fadeIn",
	  "hideMethod": "fadeOut"
	};

	$("#toast-container").delegate(".toast", "click", function(event) {
	   $(this).addClass('get-out');
		$(this).fadeOut(500);
	});

	setTimeout(function() {
		$(this).addClass('get-out');
		$("#toast-container").fadeOut(550);
	}, 3000);
	options = {
	  "trigger": "focus",
	  "placement": "right",
	  "container": "body"
	};
	$('[data-toggle="popover"]').popover(options);
});

