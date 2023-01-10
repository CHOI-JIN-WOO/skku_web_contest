/*
 ★ Coding By DumiCode
 ★ homepage: http://www.dumicode.com
*/
$(function(){

	//GNB
	$("#gnb > li > a").click(function(e){
//		e.preventDefault();	
	});

	$("#gnb > li a").on("mouseenter focus",function(){
		$("#gnb > li").not($(this).parents("#gnb > li")).removeClass("active");
		$(this).parents("#gnb > li").addClass("active");
	});

	$("#gnb > li").on("mouseleave",function(){
		$(this).removeClass("active");
	});

	$(".gnb_section .logo a, #m_content a, .location .btn_home").on("focus",function(){
		$("#gnb > li").removeClass("active");
	});

	//location
	if($(".location_nav > li").length < 3)
	{
		$(".location_nav").css("padding-right","33.3%");
	}

	$(".location_toggle > a").click(function(){
		$(this).parents(".location_toggle").toggleClass("on");
	});

	//lnb
	$(".lnb_menu > li").each(function(index){
		if($(this).find("ul").length > 0)
		{
			$(this).addClass("iscont");
		}
	});

	//family site
	$(".fmlst a").on("mouseenter focus",function(){
		$(this).parents(".fmlst").addClass("open");
	});

	$(".fmlst").on("mouseleave",function(){
		$(this).removeClass("open");
	});

	$(".fmlst a:first, .fmlst a:last").on("blur",function(){
		$(this).parents(".fmlst").removeClass("open");
	});

	$(".fmlst > a").on("touchend",function(e){

		if($(this).parent(".fmlst").hasClass("open"))
		{
			$(this).parent(".fmlst").removeClass("open")
		}
		else
		{
			$(this).parents(".fmlst").addClass("open")
			$(this).focus();
		}
		return false;
	});
});

//toggle LNB
	function toggleLNB(ts)
	{
		$(".lnb_menu > li").not($(ts).parent("li")).removeClass("on");
		$(ts).parent("li").toggleClass("on");
	}

	//popup
	// 접근성 관련 포커스 강제 이동
	function accessibilityFocus() {
		$(document).on('keydown', '[data-focus-prev], [data-focus-next]', function(e){
			var next = $(e.target).attr('data-focus-next'),
			prev = $(e.target).attr('data-focus-prev'),
			target = next || prev || false;

			if(!target || e.keyCode != 9) { return; }

			if( (!e.shiftKey && !!next) || (e.shiftKey && !!prev) ) {
				setTimeout(function(){
					$('[data-focus="' + target + '"]').focus();
				}, 1);
			}
		});
	}

	function tooltip() {
		var openBtn = '[data-tooltip]',
		closeBtn = '.tooltip-close';

		function getTarget(t) {
			return $(t).attr('data-tooltip');
		}

		function open(t) {
			var showTarget = $('[data-tooltip-con="' + t + '"]');
			showTarget.show().focus();
			showTarget.find('.tooltip-close').data('activeTarget', t);
		}

		function close(t) {
			var activeTarget = $('[data-tooltip-con="' + t + '"]');
			activeTarget.hide();
			$('[data-tooltip="' + t + '"]').focus();
		}

		$(document) .on('click', openBtn, function(e){
			e.preventDefault();
			open(getTarget(e.target));
		}) .on('click', closeBtn, function(e) {
			e.preventDefault();
			close($(this).data('activeTarget'));
		})
	}
	$(document).ready(function(){
		tooltip();
		accessibilityFocus();
	});


