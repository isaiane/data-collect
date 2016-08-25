function newDropDown() {
	var containerAcordion = $(".dropdown-acordion-menu");
	var containerAcordionOpen = $(".open-acordion-menu");
	var Accordion = function(el, multiple) {
		this.el = el || {};
		this.multiple = multiple || false;
		// Variables privadas
		var links = this.el.find('.accordion-link');
		// Evento
		links.on('click', {el: this.el, multiple: this.multiple}, this.dropdown)
	}
	Accordion.prototype.dropdown = function(e) {
		var $el = e.data.el;
			$this = $(this),
			$next = $this.next();
		$next.slideToggle();
		$this.parent().toggleClass('accordion-open');
		if (!e.data.multiple) {
			$el.find('.accordion-submenu').not($next).slideUp().parent().removeClass('accordion-open');
		};
	}
	$(".dropdown-acordion-menu .dropdown-toggle").click(function(event) {
		$(this).parent("li").toggleClass('open-acordion-menu');
	});
	$(document).mouseup(function (e) {
		if (!containerAcordion.is(e.target) && containerAcordion.has(e.target).length === 0) {
	    $('body').find('.open-acordion-menu').removeClass('open-acordion-menu');
	  }
	});
	var accordion = new Accordion($('.accordion-menu'), false);
};