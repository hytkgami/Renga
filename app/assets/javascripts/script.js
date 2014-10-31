
$(function () {
		$('#wrap').masonry({ //親要素のidを指定
			itemSelector: '.box', //整理される要素のclassを指定
			isAnimated: true, //スムースアニメーション設定
			isResizable: true, //ウィンドウサイズが変更された時に並び替え
			gutterWidth: 0
		});
		
		$(window).scroll(function () {
							var winTop = $(this).scrollTop();
							
							var head = $('header');
							var wrap = $('#wrap');
							
							var wrapTop = wrap.offset().top;
																		
							if (winTop >= wrapTop-50) {
								head.css({opacity: 1})
							} else  {
								head.css({opacity: 0})			
							}
															  										
			});

});

