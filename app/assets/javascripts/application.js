// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
//= require_tree ../../../vendor/assets/javascripts

$('#query').tagsInput({
	'height':'50px',
	'width' : '230px',
	'delimiter': [',']
});

$(function(){

	$('#idea_industry').selectpicker();

	$("#searchDate").on('click', function(){
		var start = $('#startDate').val()
		var end = $('#endDate').val()
		console.log(start);
		console.log(end);
	});

	$("#searchForm").on('submit', function(e){
		e.preventDefault();
		var query = $("#query").val();
		console.log(query);
		window.location.replace("/ideas/tagged/" + query);
	})
	

	$('.like')
		.on('ajax:send', function () { $(this).addClass('loading'); })
		.on('ajax:complete', function () { $(this).removeClass('loading'); })
		.on('ajax:error', function () { 
			console.log("ya dun goofed");
		})
		.on('ajax:success', function(e, data, status, xhr) { 
			$(this).next(".likeCount").html(data.likecount); 
			$(this).parent().find(".dislikeCount").html(data.dislikecount); 
	});

	 $('.dislike')
		.on('ajax:send', function () { $(this).addClass('loading'); })
		.on('ajax:complete', function () { $(this).removeClass('loading'); })
		.on('ajax:error', function () { 
		 	console.log("ya dun goofed");
		})
		.on('ajax:success', function(e, data, status, xhr) { 
		 	$(this).prev(".likeCount").html(data.likecount); 
		 	$(this).next(".dislikeCount").html(data.dislikecount); 
	});
})

