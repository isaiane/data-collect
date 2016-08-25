function readURL(input) {
	var img  = $("#user_profile_image_cropbox");
	var imgPreview  = $("#preview_user_profile_image_cropbox");
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function (e) {
			$(img).attr('src', e.target.result);
			$(imgPreview).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
		$(img).addClass('showing');
		$(imgPreview).removeClass('hiding');
	}
}