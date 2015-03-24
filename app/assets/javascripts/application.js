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
//= require turbolinks
//= require_tree .
//= require_tree ../../../vendor/assets/javascripts

$(function(){
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

