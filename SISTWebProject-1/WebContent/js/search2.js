$(function(){
	
	$('input[name="search2"]').addClass('search2');
	
	$('body').prepend('<div id="search_result" style="width:517px;height:500px;position:fixed;z-index:10;overflow:auto;">'+
						'<table class="table" '
							+'style="width:500px;'
							+'background-color:white;">'
						+'</table>'
					+'</div>');
	$('#search_result').hide();
	
	
	$('body').prepend('<div id="forSearchHide" style="width:100%;height:100%;position:fixed;"></div>')
	$('#forSearchHide').hide();
	$('#forSearchHide').click(function(){
		$(this).css('z-index',-1);
		$('#search_result').hide();
	});
	
	$('#header .search2').click(function(){
		$('#forSearchHide').css('z-index',9);
		$('#forSearchHide').show();
		
		$('#search_result').css('position','fixed');
		$('#search_result').offset({
			top : $(this).offset().top + 90,
			left : $(this).offset().left
		});
		$('#search_result').show();
		return false;
	});
	
	$('#header .search2').keyup(function(e){
		if(e.which==27) {
			$('#search_result').hide();
			return false;
		}
		
		$('.search2').css('cursor','wait');
		$('body').css('cursor','wait');
		
		let keyword = $(this).val().trim();
		
		$.ajax({
			type : 'post',
			url : '../main/search.do',
			data : {keyword : keyword},
			success : function(res){
				$('#search_result table').html(res);
				$('#header .search2').click();
				
				$('body').css('cursor','default');
				$('.search2').css('cursor','default');
			},
			error : function(){
				$('body').css('cursor','default');
				$('.search2').css('cursor','default');
			}
		});
	});
	
	$('.main-banner .search2').click(function(){
		$('#forSearchHide').css('z-index',9);
		$('#forSearchHide').show();
		
		$('#search_result').css('position','fixed');
		$('#search_result').offset({
			top : $(this).offset().top + 50,
			left : $(this).offset().left
		});
		$('#search_result').show();
		return false;
	});
	
	$('.main-banner .search2').keyup(function(e){
		if(e.which==27) {
			$('#search_result').hide();
			return false;
		}
		
		$('.search2').css('cursor','wait');
		$('body').css('cursor','wait');
		
		let keyword = $(this).val().trim();
		
		$.ajax({
			type : 'post',
			url : '../main/search.do',
			data : {keyword : keyword},
			success : function(res){
				$('#search_result table').html(res);
				$('.main-banner .search2').click();
				
				$('body').css('cursor','default');
				$('.search2').css('cursor','default');
			},
			error : function(){
				$('body').css('cursor','default');
				$('.search2').css('cursor','default');
			}
		});
	});
	
	$('.search2').blur(function(){
		if(!$('#search_result a').click()) {
			$('#search_result').offset({
				top : 0,
				left : 0
			});
			$('#search_result').hide();
			return false;
		}		
	});
	
	$('.heart_on').children().css('color','red');
	$('.heart_off').children().css('color','gray');
	
	$('.heart_button').click(function(){
		$(this).attr('disabled',true);
		let task_result = false;
		
		let type = $(this).attr('data-type');
		let no = $(this).attr('data-no');
		
		if($(this).hasClass('heart_on')) {
			$.ajax({
				async:false,
				type:'post',
				url:'../main/deleteFromWishlist.do',
				data:{type:type,no:no},
				success:function(res){
					if(res=='success') {
						task_result = true;
					} else {
						login_show();
					}
				}
			});
			if(task_result==true) {
				$(this).removeClass('heart_on');
				$(this).addClass('heart_off');
				$(this).children().css('color','gray');
			}
		} else {			
			$.ajax({
				async:false,
				type:'post',
				url:'../main/insertintowishlist.do',
				data:{type:type,no:no},
				success:function(res){
					if(res=='success') {
						task_result = true;
					} else {
						login_show();
					}
				}
			});
			if(task_result==true) {
				$(this).removeClass('heart_off');
				$(this).addClass('heart_on');
				$(this).children().css('color','red');
			}
		}
		
		$(this).attr('disabled',false);
	});
	
	
	$('body').append('<div id="forCursorWait" style="width:100%;height:100%;display:block;position:fixed;top:0px;left:0px;z-index:10;cursor:wait;"></div>');
	$('#forCursorWait').hide();
	
	$('#morehtitemlist').click(function(){
		$('#forCursorWait').show('fast',function(){
			let $this = $('#morehtitemlist');
			let tagcode = $($this).attr('tagcode');
			let totalpage = $($this).attr('totalpage');
			let curpage = parseInt($($this).attr('curpage'));
			curpage = curpage + 1;
			
			$.ajax({
				async:false,
				type:'post',
				url:'morehtitemlist.do',
				data:{page:curpage,tagcode:tagcode},
				success:function(res){
					$('#morehtitemlisttarget').append(res);
					$('#forCursorWait').hide();
				}
			});
			
			$($this).attr('curpage',curpage);
			$('#morehtitemlistcurpage').text(curpage);
			
			if(curpage==totalpage) {
				$('#morehtitemlisttext').remove();
				$('#morehtitemlist').remove();
			}
		});
	});
	
});

































