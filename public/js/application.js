$(document).ready(function() {
	$(".header_login_form").hide();
	$(".header_register_form").hide();
	$(".new_entry_form").hide();
	newEntryButtonListener();
	newEntryFormListener();
	loginButtonListener();
	registerButtonListener();
	editLinkListener();
});

var newEntryButtonListener = function(){
	$(".new_entry_button").on("click", function(event){
		event.preventDefault();
		$(".new_entry_form").show();
		$(this).hide();
	})
}

var newEntryFormListener = function(){
	$(".new_entry_form").on("submit", ".full_entry_form", function(event){
		event.preventDefault();

		$form = $(this)
		url = $form.attr("action")
		method = $form.attr("method")
		data = $form.serialize();

		$.ajax({
			url: url,
			method: method,
			data: data
		})

		.done(function(responce){
			$(".items_list").append(responce);
			$(".full_entry_form")[0].reset
			$(".full_entry_form").hide();
			$(".new_entry_button").show();
		})
	})
}

var loginButtonListener = function(){
	$(".login_button").on("click", function(event){
		event.preventDefault();
		$(".header_login_form").show();
		$(this).hide();
	})
}

var registerButtonListener = function(){
	$(".register_button").on("click", function(event){
		event.preventDefault();
		$(".header_register_form").show();
		$(this).hide();
	})
}

var editLinkListener = function(){
	$(".edit_link").on("click",".entry_description", function(event){
		event.preventDefault();

		link = $(this)
		url = $(this).attr('href')
			console.log(url)

		$.ajax({
			url: url
		})

		.done(function(responce){
			// $(link).closest(".edit_link").append(responce)
			
		})
	})
}
