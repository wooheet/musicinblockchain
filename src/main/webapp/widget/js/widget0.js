var audioarray = document.querySelectorAll(".varaudio");
var durationarray = document.querySelectorAll(".durationlist");
var audioSeekBararray = document.querySelectorAll(".audioSeekBarlist");
var playbuttonarray = document.querySelectorAll(".play-button");
$(document).ready(function() {
	
/*	  $("div#play-button").click(function(){
		    alert("select index : "+$(this).index("div#play-button") );
		   });*/

for(i = 0; i<10;i++){
	alert[i];
playbuttonarray[i].click(function() {
    if ($(this).hasClass("unchecked")) {
    	
    	var k = $(this).index("div.play-button");
    	alert(k);
	      $(this)
	        .addClass("play-active")
	        .removeClass("play-inactive")
	        .removeClass("unchecked");
	      $(this).parents(".player").children(".info-two")
	        .addClass("info-active");
	      $(this).parents(".player").children("#pause-button")
	        .addClass("scale-animation-active");
	      $(this).parents(".player").children(".waves-animation-one, #pause-button, .seek-field, .volume-icon, .volume-field, .info-two").show();
	      $(this).parents(".player").children(".waves-animation-two").hide();
	      $(this).parents(".player").children("#pause-button")
	        .children('.icon')
	        .addClass("icon-pause")
	        .removeClass("icon-play");
	      setTimeout(function() {
	    	  $(this).parents(".player").children(".info-one").hide();
	      }, 400);
	      audioarray[k].play();
	      audioarray[k].currentTime = 0;
/*	      audio.play();
	      audio.currentTime = 0;*/
    	
    } else {
    	if($(this).index("div.play-button")==$(".play-button").index("div.play-button")){
    		var k = $(this).index("div.play-button");
	      $(this)
	        .removeClass("play-active")
	        .addClass("play-inactive")
	        .addClass("unchecked");
	      $(this).parents(".player").children("#pause-button")
	        .children(".icon")
	        .addClass("icon-pause")
	        .removeClass("icon-play");
	      $(this).parents(".player").children(".info-two")
	        .removeClass("info-active");
	      $(this).parents(".player").children(".waves-animation-one, #pause-button, .seek-field, .volume-icon, .volume-field, .info-two").hide();
	      $(this).parents(".player").children(".waves-animation-two").show();
	      setTimeout(function() {
	    	  $(this).parents(".player").children(".info-one").show();
	      }, 150);
	      audioarray[k].pause();
	      audioarray[k].currentTime = 0;
    	}
    }
  });
}
  $("#pause-button").click(function() {
	  if($(this).index("div#pause-button")==$("#pause-button").index("div#pause-button")){
	    	var k = $(this).index("div#pause-button");
	  
	    $(this).children(".icon")
	      .toggleClass("icon-pause")
	      .toggleClass("icon-play");
	
	    if (audioarray[k].paused) {
	    	audioarray[k].play();
	    } else {
	    	audioarray[k].pause();
	    }
	  }
  });
  $("#play-button").click(function() {
	  if($(this).index("div#play-button")==$("#play-button").index("div#play-button")){
	    	var k = $(this).index("div#play-button");
	  
	    setTimeout(function() {
	    	$(this).parents(".player").children("#play-button").children(".icon")
	        .toggleClass("icon-play")
	        .toggleClass("icon-cancel");
	    }, 350);
	  }
  });
  $(".like").click(function() {
	  
	  /*
	  $(location).attr('href',url);*/

    $(".icon-heart").toggleClass("like-active");
    
  });
});

function CreateSeekBar(audioindex) {
	
  var seekbar = audioSeekBararray[audioindex];
  seekbar.min = 0;
  seekbar.max = audioarray[audioindex].duration;
  seekbar.value = 0;
}

function EndofAudio(audioindex) {
	audioSeekBararray[audioindex].value = 0;
}

function audioSeekBar(audioindex) {
  var seekbar = audioSeekBararray[audioindex];
  audioarray[audioindex].currentTime = seekbar.value;
}

function SeekBar(audioindex) {
  var seekbar = audioSeekBararray[audioindex];
  seekbar.value = audioarray[audioindex].currentTime;
}

for(i = 0;i<10 ; i++){
	audioarray[i].addEventListener("timeupdate", function() {
		  var duration = durationarray[i];
		  var s = parseInt(audioarray[i].currentTime % 60);
		  var m = parseInt((audioarray[i].currentTime / 60) % 60);
		  duration.innerHTML = m + ':' + s;
		}, false);
}


Waves.init();
Waves.attach(".play-button", ["waves-button", "waves-float"]);
Waves.attach("#pause-button", ["waves-button", "waves-float"]);