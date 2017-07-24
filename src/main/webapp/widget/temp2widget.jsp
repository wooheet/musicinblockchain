
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=868">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400'>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/node-waves/0.7.5/waves.min.css'>
<link rel="stylesheet" href="/FairMusic/widget/css/widget.css">

<title>Insert title here</title>



</head>
<body>
<div class="containera">
  <div class="player">
    <div class="like waves-effect waves-light">
      <i class="icon-heart"></i>
    </div>
    <div class="mask"></div>
    <ul class="player-info info-one">
      <li>Rock'n'Roll Nerd</li>
      <li>Tim Minchin</li>
      <li>5:34</li>
    </ul>
    <ul class="player-info info-two">
      <li>Rock'n'Roll Nerd</li>
      <li>Tim Minchin</li>
      <li><span id="duration"></span><i> / </i>5:34</li>
    </ul>
    <div id="play-button" class="unchecked">
      <i class="icon icon-play"></i>
    </div>
    <div class="control-row">
      <div class="waves-animation-one"></div>
      <div class="waves-animation-two"></div>
      <div id="pause-button">
        <i class="icon"></i>
      </div>
      <div class="seek-field">
        <input id="audioSeekBar" min="0" max="334" step="1" value="0" type="range" oninput="audioSeekBar()" onchange="this.oninput()">
      </div>
      <div class="volume-icon">
        <i class="icon-volume-up"></i>
      </div>
      <div class="volume-field">
        <input type="range" min="0" max="100" value="100" step="1" oninput="audio.volume = this.value/100" onchange="this.oninput()">
      </div>
    </div>
  </div>
</div>
<audio id="audio-player" ontimeupdate="SeekBar()" ondurationchange="CreateSeekBar()" preload="auto" loop>
  <source src="https://goo.gl/L3PFFI" type="audio/mpeg">
</audio>


  <script src='https://code.jquery.com/jquery-2.1.1.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/node-waves/0.7.5/waves.min.js'></script>
<script src="/FairMusic/widget/js/widget.js"></script>
</body>

</html>