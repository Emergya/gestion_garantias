$(document).ready(function(){
	// Override the tooltip widget to show html content in tooltips
	$.widget("ui.tooltip", $.ui.tooltip, {
	   options: {
	       content: function () {
	           return $(this).prop('title');
	       }
	   }
	});

	$(".dialog_ans").dialog({
		autoOpen: false,
		minWidth: 700,
		height: 400
	});

	$(".button_ans").click(function(){
		$id = $(".button_ans").data("id");
		$(".dialog_ans_"+$id).dialog("open");
	});

	$(".tooltip_contacts").tooltip({
		tooltipClass: "contact_tooltip"
	});

});