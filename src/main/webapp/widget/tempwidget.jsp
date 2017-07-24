<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  


</head>
<body>
<div class="wrapper">
	<h1>REMIXES</h1>
	<h2>by yours truly</h2>
	<audio src="" id="hidden-player"></audio>
	<div id="player">
		<img src="" class="coverr" alt="" height="200" width="200" />
		<div class="player-song">
			<div class="title"></div>
			<div class="artist"></div>
			<progress value="0" max="1"></progress>
			<div class="timestamps">
				<div class="time-now">0:00:00</div>
				<div class="time-finish">0:00:00</div>
			</div>
			<div class="actions">
				<div class="prev">
					<i class="material-icons">fast_rewind</i>
				</div>
				<div class="play">
					<a class="play-button paused" href="#">
						<div class="left"></div>
						<div class="right"></div>
						<div class="triangle-1"></div>
						<div class="triangle-2"></div>
					</a>
				</div>
				<div class="next">
					<i class="material-icons">fast_forward</i>
				</div>
			</div>
		</div>
	</div>
</div>
<style type="text/css">
$overlay: #333DDD;

//usual reset stuff
*,*:before,*:after,ul,li,a,button,input,h1,h2,h3,h4,h5,h6,p, img, image, svg, path, g  {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	background-color: transparent;
	border: none;
	text-decoration: none;
	font-family: 'Roboto';
	user-select: none;
}

html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
	background-color: #FAFAFA;
	font-family: 'Roboto';
}

.wrapper {
	width: 100%;
	min-height: 100vh;
  	background-size: cover;
	position: relative;
	z-index: 1;
	background: url("https://images.unsplash.com/photo-1451444635319-e5e247fbb88d?ixlib=rb-0.3.5&q=80&fm=jpg") no-repeat center center fixed;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	
	&:after {
		content: "";
		position: absolute;
		width: 100%;
		height: 100%;
		background-color: rgba($overlay, .8);
		left: 0;
		top: 0;
	}
}

h1 {
	position: relative;
	z-index: 2;
	color: white;
	font-weight: 900;
	font-size: 5em;
	//margin-top: 50px;
}

h2 {
	position: relative;
	z-index: 2;
	color: white;
	font-weight: 300;
	font-size: 1em;
	margin-bottom: 50px;
	margin-top: -10px;
}

#player {
	position: relative;
	z-index: 2;
	width: 600px;
	height: 150px;
	background-color: #fff;
	border-radius: 10px;
	display: flex;
	img {
		position: absolute;
		left: 15px;
		top: -25px;
		border-radius: 10px;
	}
	.player-song {
		width: 370px;
		height: 100%;
		margin-left: 230px;
		//background-color: red;
		
		.title {
			color: #333;
			font-weight: 500;
			font-size: 20px;
			margin-top: 20px;
		}
		
		.artist {
			font-size: 14px;
			font-weight: 400;
			color: rgba(0,0,0,.5);
		}
		
		.timestamps {
			width: calc(100% - 15px);
			display: flex;
			justify-content: space-between;
			font-size: 10px;
			color: rgba(0,0,0,.4);
		}
		
		.actions {
			width: 100%;
			height: 30px;
			display: flex;
			justify-content: center;
			align-items: center;
			
			.next, .prev {
				cursor: pointer;
			}
			
			i {
				font-size: 32px;
				transform: translateY(2px);
				color: darken(#eee, 20%);
				transition: .1s;
				
				&:hover {
					color: darken(#eee, 40%);
					transition: .1s;
				}
			}
		}
	}
}

progress[value] {
	-webkit-appearance: none;
	appearance: none;	
	width: calc(100% - 15px);
  	height: 6px;
	border-radius: 50px;
	margin-top: 20px;
}

progress[value]::-webkit-progress-bar {
  	background-color: #eee;
	border-radius: 50px;
}

progress[value]::-webkit-progress-value {
 	border-radius: 50px; 
   background-color: #333DDD;
}

.play-button {
  height: 16px;
  width: 16px;
  display: block;
  overflow: hidden;
  position: relative;
	margin: 0 10px;
	
	&:hover {
		.left, .right {
			background-color: darken(#eee, 40%);
		}
	}
}
.left {
  height: 100%;
  float: left;
  background-color: darken(#eee, 20%);
  width: 36%;
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
  overflow: hidden;
}
.triangle-1 {
  -webkit-transform: translate(0, -100%);
          transform: translate(0, -100%);
}
.triangle-2 {
  -webkit-transform: translate(0, 100%);
          transform: translate(0, 100%);
}
.triangle-1,
.triangle-2 {
  position: absolute;
  top: 0;
  right: 0;
  background-color: transparent;
  width: 0;
  height: 0;
  border-right: 16px solid #fff;
  border-top: 8px solid transparent;
  border-bottom: 8px solid transparent;
  -webkit-transition: -webkit-transform 0.25s ease;
  transition: -webkit-transform 0.25s ease;
  transition: transform 0.25s ease;
  transition: transform 0.25s ease, -webkit-transform 0.25s ease;
}
.right {
  height: 100%;
  float: right;
  width: 36%;
  background-color: darken(#eee, 20%);
  -webkit-transition: all 0.25s ease;
  transition: all 0.25s ease;
}
.paused .left {
  width: 50%;
}
.paused .right {
  width: 50%;
}
.paused .triangle-1 {
  -webkit-transform: translate(0, -50%);
          transform: translate(0, -50%);
}
.paused .triangle-2 {
  -webkit-transform: translate(0, 50%);
          transform: translate(0, 50%);
}


</style>
  <script type="text/javascript">
  var num = 0;
  var hiddenPlayer = $('#hidden-player');
  var player = $('#player');
  var title = $('.title');
  var artist = $('.artist');
  var cover = $('.coverr');

  function secondsTimeSpanToHMS(s) {
  	var h = Math.floor(s / 3600); //Get whole hours
  	s -= h * 3600;
  	var m = Math.floor(s / 60); //Get remaining minutes
  	s -= m * 60;
  	return h + ":" + (m < 10 ? '0' + m : m) + ":" + (s < 10 ? '0' + s : s); //zero padding on minutes and seconds
  };

  songs = [{
  		src: "http://k003.kiwi6.com/hotlink/kl9ks5jrd2/Oddisee_-_Fast_Lane_Speedin_Remix_by_Kristjan_Vool_.mp3",
  		title: "Fast Lane Speedin'",
  		artist: "Oddisee",
  		coverart: "http://static.djbooth.net/pics-features/oddisee-art-thumb.jpg"
  	},

  	{
  		src: "http://k003.kiwi6.com/hotlink/4vtefws0vt/Andy_Mineo_-_Superhuman_Remix_by_Kristjan_Vool_.mp3",
  		title: "Superhuman",
  		artist: "Andy Mineo",
  		coverart: "http://static.djbooth.net/pics-artist/andy-mineo.jpg"
  	},

  	{
  		src: "http://k003.kiwi6.com/hotlink/gqfxjp1jdw/Wild_Things_remix.mp3",
  		title: "Wild Things",
  		artist: "Andy Mineo",
  		coverart: "http://static.djbooth.net/pics-artist/andy-mineo.jpg"
  	},

  	{
  		src: "http://k003.kiwi6.com/hotlink/l3qgre6elk/j_cole_full_song_remix.mp3",
  		title: "Work Out",
  		artist: "J. Cole",
  		coverart: "https://s3.amazonaws.com/hiphopdx-production/2014/12/J.-Cole-%E2%80%93-Apparently-e1418166093622-300x300.jpg"
  	},

  	{
  		src: "http://k003.kiwi6.com/hotlink/m70002cocx/Andy_Mineo_-_Cocky_Remix_by_Kristjan_Vool_.mp3",
  		title: "Cocky",
  		artist: "Andy Mineo",
  		coverart: "http://static.djbooth.net/pics-artist/andy-mineo.jpg"
  	}
  ];

  var initSongSrc = songs[0].src;
  var initSongTitle = songs[0].title;
  var initSongArtist = songs[0].artist;
  var initSongCover = songs[0].coverart;

  hiddenPlayer.attr("src", initSongSrc);
  title.html(initSongTitle);
  artist.html(initSongArtist);
  cover.attr('src', initSongCover);

  hiddenPlayer.attr('order', '0');
  hiddenPlayer[0].onloadedmetadata = function() {
  	var dur = hiddenPlayer[0].duration;
  	var songLength = secondsTimeSpanToHMS(dur)
  	var songLengthParse = songLength.split(".")[0];
  	$('.time-finish').html(songLengthParse);
  };

  var items = songs.length - 1;

  $('.next').on('click', function() {
  	var songOrder = hiddenPlayer.attr('order');

  	if (items == songOrder) {
  		num = 0;
  		var songSrc = songs[0].src;
  		var songTitle = songs[0].title;
  		var songArtist = songs[0].artist;
  		var songCover = songs[0].coverart;
  		hiddenPlayer.attr('order', '0');
  		hiddenPlayer.attr('src', songSrc).trigger('play');
  		title.html(songTitle);
  		artist.html(songArtist);
  		cover.attr('src', songCover);
  	} else {
  		console.log(songOrder);
  		num += 1;
  		var songSrc = songs[num].src;
  		var songTitle = songs[num].title;
  		var songArtist = songs[num].artist;
  		var songCover = songs[num].coverart;
  		hiddenPlayer.attr('src', songSrc).trigger('play');
  		title.html(songTitle);
  		artist.html(songArtist);
  		cover.attr('src', songCover);
  		hiddenPlayer.attr('order', num);
  	}
  });

  $('.prev').on('click', function() {
  	var songOrder = hiddenPlayer.attr('order');

  	if (songOrder == 0) {
  		num = items;
  		var songSrc = songs[items].src;
  		var songTitle = songs[items].title;
  		var songArtist = songs[items].artist;
  		hiddenPlayer.attr('order', items);
  		hiddenPlayer.attr('src', songSrc).trigger('play');
  		title.html(songTitle);
  		artist.html(songArtist);
  	} else {
  		num -= 1;
  		var songSrc = songs[num].src;
  		var songTitle = songs[num].title;
  		var songArtist = songs[num].artist;
  		hiddenPlayer.attr('src', songSrc).trigger('play');
  		title.html(songTitle);
  		artist.html(songArtist);
  		hiddenPlayer.attr('order', num);
  	}
  });

  $(".play-button").click(function() {
  	$(this).toggleClass("paused");
  	if ($(this).hasClass("paused")) {
  		hiddenPlayer[0].pause();
  	} else {
  		hiddenPlayer[0].play();
  	}
  });

  hiddenPlayer.on('timeupdate', function() {
  	var songLength = secondsTimeSpanToHMS(this.duration)
  	var songLengthParse = songLength.split(".")[0];
  	$('.time-finish').html(songLengthParse);

  	var songCurrent = secondsTimeSpanToHMS(this.currentTime)
  	var songCurrentParse = songCurrent.split(".")[0];
  	$('.time-now').html(songCurrentParse);
  	$('progress').attr("value", this.currentTime / this.duration);

  	if (!hiddenPlayer[0].paused) {
  		$(".play-button").removeClass('paused');
  		$('progress').css('cursor', 'pointer');
  		
  		
  		$('progress').on('click', function(e) {
  			var parentOffset = $(this).parent().offset(); 
  			var relX = e.pageX - parentOffset.left;
  			var percPos = relX * 100 / 355;
  			var second = hiddenPlayer[0].duration * parseInt(percPos) / 100;
  			console.log(second);
  			hiddenPlayer[0].currentTime = second;
  		})
  	}
  	
  	if (this.currentTime == this.duration) {
  		$('.next').trigger('click');
  	}
  });
  
  </script>
</body>
</html>