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
		i = $(".delete_ans").data("count");
		$(".field_for_ans_"+i).remove();
	});

	// Comprobamos si existe un usuario para el e-mail indicado.
	$(".input_contact_email").focusout(function(){
		// El nivel al que pertenece el contacto.
		level = $(this).data("level");
		// En el caso de que el campo introducido no esta vacio.
		user_email = $(".input_contact_email_"+level).val();
		if(user_email !== ""){
			// Petición AJAX para comprobar si ese correo existe o no.
			$.ajax({
				url: "/find_user",
				type: "GET",
				data: { user_email: user_email },
				success: function(response) { findUserRedmine(response.user, level); },
				error: function(xhr) { console.log(xhr); }
			});
		}
	});

	function findUserRedmine(user, level){
		// En caso de que no exista ese correo, damos la posibilidad de poder crear el usuario.
		if($.isEmptyObject(user)){
			// Eliminamos el value el campo asociado al formulario en el caso de que exista.
			$("#gg_article_level_"+level).val(""); //removeAttr("value");

			// Ocultamos el bloque de atributos del contacto.
			$(".contact_exist_"+level).hide();

			// Mostramos el botón para poder crear el usuario.
			$(".contact_not_exist_"+level).show();

		} else {
			// Mostramos el bloque de atributos del contacto.
			$(".contact_exist_"+level).show();

			// Añadimos el nombre del contacto.
			$(".contact_name_"+level).empty();
			$(".contact_name_"+level).append("<label><b>Nombre: </b></label><br>");
			$(".contact_name_"+level).append(user.firstname+ " " + user.lastname);

			// Añadimos el teléfono del contacto.
			$(".contact_phone_"+level).empty();
			$(".contact_phone_"+level).append("<label><b>Teléfono: </b></label><br>");
			$(".contact_phone_"+level).append(user.phone);

			// Ocultamos el botón para poder crear el usuario.
			$(".contact_not_exist_"+level).hide();

			// Añadimos la ID del usuario al campo del formulario.
			$("#gg_article_level_"+level).val(user.id);
		}
	}

	$(".btn_create_contact").on("click", function(e){
		e.preventDefault();
        e.stopPropagation();

        // Añadimos una clase al input para poder identificarlo mas adelante con el focus y el focusOut.
        $('.input_contact_email_'+$(this).data('level')).addClass('in_use');
		
		// Abrimos el modal para crear el usuario.		
		$(".dialog_create_user").dialog("open");

		// Recogemos el nivel e introducimos el correo, y nombre por defecto.
		level = $(this).data("level");
		email = $(".input_contact_email_"+level).val();
		name = email.split('@')[0];

		$("#dialog_user_email").text(email);
		$("#mail").val(email); // Campo oculto.
		$(".dialog_user_name").val(name);
		$("#password").val(name); // Campo oculto.

		if(!isEmail(email)){
			$("#dialog_user_btn_create").attr("disabled", true);
			$(".dialog_user_msg_error").show();
		} else {
			$("#dialog_user_btn_create").attr("disabled", false);
			$(".dialog_user_msg_error").hide();
		}
	});

	// Expresión para validar el e-mail.
	function isEmail(email) {
	  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
	}

	// Crear el usuario desde el modal
	$("#dialog_user_btn_create").on("click", function(e){
		e.preventDefault();
        e.stopPropagation();

		// Petición AJAX para crear un nuevo usuario.
		$.ajax({
			url: "/modal_create_user",
			type: "GET",
			data: $('#formModalUser').serialize(),
			success: function(response) { createUserRedmine(response); },
			error: function(xhr) { console.log(xhr); }
		});
	});

	function createUserRedmine(data){
		// Indicación de si el usuario se ha creado con éxito o no.
		$('.flash').addClass(data.type);
		$('.flash').text(data.msg);
		$('.flash').show();

		// Actualizamos el campo del contacto para que aparezcan sus datos
		$('.in_use').focus();
		$('.in_use').focusout();

		// Cierre del modal automaticamente.
		$( ".dialog_create_user" ).dialog( "close" );
	}
});