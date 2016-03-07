$(document).ready(function(){
	
	// Override the tooltip widget to show html content in tooltips
	$.widget("ui.tooltip", $.ui.tooltip, {
	   options: {
	       content: function () {
	           return $(this).prop('title');
	       }
	   }
	});

	$(".tooltip_contacts").tooltip({
		tooltipClass: "contact_tooltip"
	});

	$(".dialog_ans").dialog({
		autoOpen: false,
		minWidth: 700,
		height: 400
	});

	$(".button_ans").click(function(){
		$id = $(this).data("id");
		$(".dialog_ans_"+$id).dialog("open");
	});

});