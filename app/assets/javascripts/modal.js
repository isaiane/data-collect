function callModal() {
  // Test for placeholder support
  $.support.placeholder = (function(){
    var i = document.createElement('input');
    return 'placeholder' in i;
  })();
  // Hide labels by default if placeholders are supported
  if($.support.placeholder) {
    $('.form-label').each(function(){
      $(this).addClass('js-hide-label');
    });
    // Code for adding/removing classes here
    $('.form-group').find('input, textarea').on('keyup blur focus', function(e){
      // Cache our selectors
      var $this = $(this),
        $parent = $this.parent().find("label");

      if (e.type == 'keyup') {
        if( $this.val() == '' ) {
          $parent.addClass('js-hide-label');
        } else {
          $parent.removeClass('js-hide-label');
        }
      }
      else if (e.type == 'blur') {
        if( $this.val() == '' ) {
            $parent.addClass('js-hide-label');
        }
        else {
            $parent.removeClass('js-hide-label').addClass('js-unhighlight-label');
        }
      }
      else if (e.type == 'focus') {
        if( $this.val() !== '' ) {
            $parent.removeClass('js-unhighlight-label');
        }
      }
    });
  }
  setTimeout(function(){
    $(".overlay .modal").each(function(index, modal) {
      var height = $(modal).find('.content-modal').height() + 35;
      if($(modal).attr('id') != "privacy-policy") {
        var content = $(modal).find('.content-modal');
        $(modal).css({
          'height': height,
        });
      }
    });
  }, 750);

  $('.call-modal, .call-modal-destroy').click(function(e) {
    if ($(this).hasClass('call-modal-destroy')) {
      var modal = $("#destroy");
      $("#button-destroy").attr('href', $(this).attr('href'));
    } else {
      var modal = $(this).attr("href");
    }
    var height = $(modal).find('.content-modal').height() + 35;
    $('.overlay').addClass('active');
    if (560 > $(window).width()) {
      $(modal).css({
        'margin-top': 0,
        'top': window.pageYOffset
      });
    } else {
     $(modal).css({
        'margin-top': height/-1.5
      });
    }
    if($(this).data("product")) {
      $($(this).attr('href')).find("[name='product']").val($(this).data("product"));
    }
    $(modal).addClass('active');
    e.preventDefault();
  });

  $('.modal .close-modal, .overlay .dark-side, .button-wrapper').click(function(e) {
    var contentResut = $(this).parents(".modal").find('.bait-result');
    var contentBait = $(this).parents(".modal").find('.bait-content');
    e.preventDefault();
    $('.overlay, .modal.active').removeClass('active');
    setTimeout(function(){
      $(contentBait).show();
      $(contentResut).hide().css('opacity', '0');
      $(".button-wrapper").attr('class', 'button-wrapper');
      modalRezise(contentBait);
    }, 300);
  });

  $('.modal .call-modal').click(function(e) {
    var modal = $(this).attr("href");
    $('.overlay, .modal.active').removeClass('active');
    e.preventDefault();
    setTimeout(function(){
      $('.overlay').addClass('active');
      $(modal).addClass('active');
    }, 500);
  });

  $('#confirmation-destroy').keyup(function(event) {
    event.preventDefault();
    var daddy = $(this).parents(".modal");
    var button = $(daddy).find(".btn-danger");
    if ($(this).val() == "DESTROY") {
      $(button).removeAttr("disabled");
    } else {
      $(button).attr('disabled', 'disabled');;
    }
  });
};

function modalRezise(element) {
  var height = $(element).parents('.content-modal').height() + 40;
  var content = $(element).parents('.content-modal');
  if ($(content).length) {
    var modal = $(content).parents(".modal");
    if (560 > $(window).height()) {
      $(modal).css({
        'margin-top': 0,
        'top': 0
      });
    } else {
      $(modal).animate({
        'margin-top': height/-1.5,
        'height': height
      }, 50);
    }
  }
}