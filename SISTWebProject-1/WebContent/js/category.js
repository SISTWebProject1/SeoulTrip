const btn = document.getElementsByClassName('heart_button');

for (var i = 0; i < btn.length; i++) {
  btn[i].addEventListener('mouseover', changeColor.bind(this, i, 'red'));
  btn[i].addEventListener('mouseout', changeColor.bind(this, i, 'white'));
}
function changeColor(i, color) {
  btn[i].style.backgroundColor = color;
}



var imgTarget = $('.preview-image .upload-hidden'); 
imgTarget.on('change', function(){ 
	var parent = $(this).parent(); 
	parent.children('.upload-display').remove();
	
	if(window.FileReader){ 
	if (!$(this)[0].files[0].type.match(/image\//))return; 
	var reader = new FileReader(); 
	reader.onload = function(e){ 
		
	var src = e.target.result; 
	parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img src="'+src+'" class="upload-thumb"></div></div>'); 
	} 
	reader.readAsDataURL($(this)[0].files[0]); 
} 
	else { 
		$(this)[0].select(); 
		$(this)[0].blur(); 
		var imgSrc = document.selection.createRange().text; 
		parent.prepend('<div class="upload-display"><div class="upload-thumb-wrap"><img class="upload-thumb"></div></div>'); 
		
		var img = $(this).siblings('.upload-display').find('img'); 
		img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")"; 
	} 
});


/*$('.col-lg-4 img').each(function(){
	$(this).css({
	"left": "50%",
	"top": "50%",
	});
	});

$('.col-md-4 img').each(function(){
	$(this).css({
	"left": "50%",
	"margin-left": "-"+( $(this).width()/2 )+"px",
	"top": "50%",
	"margin-top": "-"+( $(this).height()/2 )+"px"
	});
	});*/




/*
$('#joinimage').on('change', function() {
    
    ext = $(this).val().split('.').pop().toLowerCase(); //확장자
    
    //배열에 추출한 확장자가 존재하는지 체크
    if($.inArray(ext, ['gif', 'png', 'jpg', 'jpeg']) == -1) {
        resetFormElement($(this)); //폼 초기화
        window.alert('이미지 파일이 아닙니다! (gif, png, jpg, jpeg 만 업로드 가능)');
    } else {
        file = $('#joinimage').prop("files")[0];
        blobURL = window.URL.createObjectURL(file);
        $('#image_preview img').attr('src', blobURL);
        $('#image_preview').slideDown(); //업로드한 이미지 미리보기 
        $(this).slideUp(); //파일 양식 감춤
    }
});

$('#image_preview a').bind('click', function() {
    resetFormElement($('#joinimage')); //전달한 양식 초기화
    $('#joinimage').slideDown(); //파일 양식 보여줌
    $(this).parent().slideUp(); //미리 보기 영역 감춤
    return false; //기본 이벤트 막음
});
    

function resetFormElement(e) {
    e.wrap('<form>').closest('form').get(0).reset(); 
    e.unwrap(); //감싼 <form> 태그를 제거
}*/

























