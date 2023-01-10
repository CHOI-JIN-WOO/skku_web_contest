/*
 ★ Coding By DumiCode
 ★ homepage: http://www.dumicode.com
*/
$(function(){

	//mainPop
	var mPopSwiper = new Swiper('.main_pop',{
		effect : 'fade',
		prevButton:'.main_pop .swiper-button-prev',
		nextButton:'.main_pop .swiper-button-next',
	});
	$(".main_pop .swiper-slide a").each(function(index){
		$(this).on("focus", function(e){
			e.preventDefault();
			mPopSwiper.slideTo(index);
		});
	});

	//mainTab
	var $tabtit = $(".m_board_tab h4 .tit");
	var $tabmore = $(".m_board_tab .btn_more");
	$tabtit.on("click focus", function(e){
		e.preventDefault();
		$(this).parents(".m_board_tab").find("li").removeClass("active");
		$(this).parents("li").addClass("active");
	});
	$tabmore.on("focus", function(e){
		e.preventDefault();
		$(this).parents(".m_board_tab").find("li").removeClass("active");
		$(this).parents("li").addClass("active");
	});

	//main banner slide
	var $mbn_bstop = $(".m_bnslide .btn_play_stop .btn_stop");
	var $mbn_bplay = $(".m_bnslide .btn_play_stop .btn_play");
	var $mbn_sa = $(".m_bnslide .swiper-slide a");

	var mbnSwiper = new Swiper('.m_bnslide .swiper-container',{
		autoplay: 3000,
		effect : 'fade',
		pagination : '.m_bnslide .swiper-pagination',
		paginationClickable :true,
		prevButton:'.m_bnslide .swiper-button-prev',
		nextButton:'.m_bnslide .swiper-button-next',
		onInit: function(swiper){
			$(".txt_pagination .ta_a").text(swiper.activeIndex + 1);
			$(".txt_pagination .ta_t").text(swiper.slides.length);
		},
		onSlideChangeStart: function(swiper){
			$(".txt_pagination .ta_a").text(swiper.activeIndex + 1);
			$(".txt_pagination .ta_t").text(swiper.slides.length);
		},
		onAutoplayStart: function(swiper){
			$mbn_bplay.hide();
			$mbn_bstop.show().addClass("on");
		},
		onAutoplayStop: function(swiper){
			$mbn_bstop.hide();
			$mbn_bplay.show().addClass("on");
		},
		
	});

	$mbn_bstop.on("click", function(e){
		e.preventDefault();
		$(this).hide();
		$mbn_bplay.show().addClass("on").focus();
		mbnSwiper.stopAutoplay();
	});
	$mbn_bplay.on("click", function(e){
		e.preventDefault();
		$(this).hide();
		$mbn_bstop.show().addClass("on").focus();
		mbnSwiper.startAutoplay();
	});

	
	$mbn_sa.each(function(index){
		$mbn_sa.eq(index).on("focus", function(e){
			e.preventDefault();
			mbnSwiper.slideTo(index);
		});
	});

	//mobile golinks
	var $main_gsa = $(".golink_section > ul > li .inbox h4 a");
	$main_gsa.on("click", function(e){
		e.preventDefault();
		$(".golink_section > ul > li").not($(this).parents("li")).removeClass("on");
		$(this).parents("li").toggleClass("on");
	});
	
});

//close main pop
function closeMainPop() {
	$(".main_pop_wrap").slideUp("fast");
}