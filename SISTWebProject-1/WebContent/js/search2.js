$(function(){
	
	$('input[name="search2"]').addClass('search2');
	
	$('body').prepend('<table class="table" id="search_result" '
						+'style="width:500px;height:800px;position:fixed;z-index:10;'
						+'background-color:white;border-radius:50px;">'
						+'</table>');
	$('#search_result').hide();
	
	$('#header .search2').click(function(){
		$('#search_result').css('position','fixed');
		$('#search_result').offset({
			top : $(this).offset().top + 90,
			left : $(this).offset().left
		});
		$('#search_result').show();
		return false;
	});
	
	$('#header .search2').keyup(function(){
		$('*').css('cursor','wait');
		
		let keyword = $(this).val().trim();
		
		$.ajax({
			type : 'post',
			url : '../main/search.do',
			data : {keyword : keyword},
			success : function(res){
				$('#search_result').html(res);
				$('#header .search2').click();
				$('*').css('cursor','default');
			},
			error : function(){
				$('*').css('cursor','default');
			}
		});
		
	});
	
	$('.main-banner .search2').click(function(){
		$('#search_result').css('position','fixed');
		$('#search_result').offset({
			top : $(this).offset().top + 50,
			left : $(this).offset().left
		});
		$('#search_result').show();
		return false;
	});
	
	$('.main-banner .search2').keyup(function(){
		$('*').css('cursor','wait');
		
		let keyword = $(this).val().trim();
		
		$.ajax({
			type : 'post',
			url : '../main/search.do',
			data : {keyword : keyword},
			success : function(res){
				$('#search_result').html(res);
				$('.main-banner .search2').click();
				$('*').css('cursor','default');
			},
			error : function(){
				$('*').css('cursor','default');
			}
		});
		
	});
	
	$('.search2').blur(function(){
		$('#search_result').offset({
			top : 0,
			left : 0
		});
		$('#search_result').hide();
		return false;
	});
	
});

































