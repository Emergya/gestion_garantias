$(document).ready(function(){
	$('.add_ans').on('click', function(){
		if (typeof i === 'undefined'){
			i = parseInt($(".add_ans").data("count"));
		}else{
			i++;
		}

		$div_fieldset_open  = "<fieldset class='f_ans field_for_ans_"+i+"'>"
		$label_priority     = "<p class='l_ans'><label for='gg_article_gg_ans_attributes_"+i+"_Prioridad: '>Prioridad: </label></p>"
		$input_priority     = "<input class='t_ans' id='gg_article_gg_ans_attributes_"+i+"_priority' name='gg_article[gg_ans_attributes]["+i+"][priority]' size='30' type='text'>"
		$label_description  = "<p class='l_ans'><label for='gg_article_gg_ans_attributes_"+i+"_Descripción: '>Descripción: </label></p>"
		$input_description  = "<textarea class='t_ans' cols='40' id='gg_article_gg_ans_attributes_"+i+"_description' name='gg_article[gg_ans_attributes]["+i+"][description]' rows='7'></textarea>"
		$link_delete        = "<a class='delete_ans' data-count="+ i +" data-confirm='¿Desea eliminar este artículo?'><span class='icon icon-del delete_text'>Eliminar</span></a>"
		$div_fieldset_close = "</fieldset>"

		$fieldset_complete = $div_fieldset_open + $label_priority + $input_priority + $label_description + $input_description + $link_delete + $div_fieldset_close

		$(".btn_add_ans").before($fieldset_complete);
	});

	$(document).on('click', '.delete_ans', function(){
		console.log("PRUEBA ENTRO");
		i = $(".delete_ans").data("count");
		$(".field_for_ans_"+i).remove();
	});
});