// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

// 12345.number_with_delimiter(','); 
Number.prototype.number_with_delimiter = function(delimiter) {
	var number = this + '', delimiter = delimiter || ',';
	var split = number.split('.');
	split[0] = split[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1' + delimiter);
	return split.join('.');
};
// number_with_delimiter(12345678.555, ',')
function number_with_delimiter(number, delimiter) {
	number = number + '', delimiter = delimiter || ',';
	var split = number.split('.');
	split[0] = split[0].replace(/(\d)(?=(\d\d\d)+(?!\d))/g, '$1' + delimiter);
	return split.join('.');
};

function number_format(elm){
  elm.value =  number_with_delimiter( elm.value, ",")
  //elm.value =  Number(elm.value).number_with_delimiter()
}
function delete_number_delimiter(elm){
  elm.value = elm.value.replace(/[^\d\.]/g,'');
}


/* nicemenu */

$(document).ready(function(){

	$("#nicemenu img.arrow").click(function(){ 
								
		$("span.head_menu").removeClass('active');
		
		submenu = $(this).parent().parent().find("div.sub_menu");
		
		if(submenu.css('display')=="block"){
			$(this).parent().removeClass("active"); 	
			submenu.hide(); 		
			$(this).attr('src','/assets/arrow_hover.png');									
		}else{
			$(this).parent().addClass("active"); 	
			submenu.fadeIn(); 		
			$(this).attr('src','/assets/arrow_select.png');	
		}
		
		$("div.sub_menu:visible").not(submenu).hide();
		$("#nicemenu img.arrow").not(this).attr('src','/assets/arrow.png');
						
	})
	.mouseover(function(){ $(this).attr('src','/assets/arrow_hover.png'); })
	.mouseout(function(){ 
		if($(this).parent().parent().find("div.sub_menu").css('display')!="block"){
			$(this).attr('src','/assets/arrow.png');
		}else{
			$(this).attr('src','/assets/arrow_select.png');
		}
	});

	$("#nicemenu span.head_menu").mouseover(function(){ $(this).addClass('over')})
								 .mouseout(function(){ $(this).removeClass('over') });
	
	$("#nicemenu div.sub_menu").mouseover(function(){ $(this).fadeIn(); })
							   .blur(function(){ 
							   		$(this).hide();
									$("span.head_menu").removeClass('active');
								});		
								
	$(document).click(function(event){ 		
			var target = $(event.target);
			if (target.parents("#nicemenu").length == 0) {				
				$("#nicemenu span.head_menu").removeClass('active');
				$("#nicemenu div.sub_menu").hide();
				$("#nicemenu img.arrow").attr('src','/assets/arrow.png');
			}
	});			   
							   
								   
});

