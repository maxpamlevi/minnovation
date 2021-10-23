
function startTimer(duration, display) {
  var timer = duration, minutes, seconds;
  setInterval(function () {
    minutes = parseInt(timer / 60, 10);
    seconds = parseInt(timer % 60, 10);

    minutes = minutes < 10 ? "0" + minutes : minutes;
    seconds = seconds < 10 ? "0" + seconds : seconds;

    display.html( "15d 8h "+ minutes + "min " + seconds+'s');

    if (--timer < 0) {
      timer = duration;
    }
  }, 1000);
}

  $(function (){
    var fiveMinutes = 60 * 5,
      display = $('.time');
    if (display.length){
      display.each(function (aa){
        startTimer(fiveMinutes, $(this));
      })
    }
  })
