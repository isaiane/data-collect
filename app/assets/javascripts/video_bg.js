function bgVideo() {
  var bgVideo = $(".bg-video");
  $.each(bgVideo, function(i, video) {
    var path = $(video).data('path');
    $(video).vide({
      mp4: path,
      webm: path,
      ogv: path,
      poster: path
    }, {
      volume: 0,
      playbackRate: 1,
      muted: true,
      loop: true,
      autoplay: true,
      position: 'center', // Similar to the CSS `background-position` property.
      posterType: 'jpg', // Poster image type. "detect" — auto-detection; "none" — no poster; "jpg", "png", "gif",... - extensions.
      resizing: false, // Auto-resizing, read: https://github.com/VodkaBears/Vide#resizing
      bgColor: 'transparent' // Allow custom background-color for Vide div
    });
    if (isMobile(navigator.userAgent||navigator.vendor||window.opera)) {
      $(video).addClass('bg-img');
      $(video).parents('.bg-grid').removeClass('bg-grid');
    };
  });
};