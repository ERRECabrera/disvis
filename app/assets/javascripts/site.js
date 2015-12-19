var current_user = false;
var player = null;
var count_tracks = 0;
var track = null;
var cue_class = null;

function player_ready(){
  player.on('canplay', function(){
    $('#div-video').fadeIn(1000);
    if (current_user){
      $('#div-video').removeClass('disabled');
      track = player.textTracks()[count_tracks-1];
      coments_box();
    }else{
      $('.log-in').fadeIn(1000);
    };
  });
};

function see_videos(){
  
  load_track();
  $('#log-off').show();
  document.getElementById('input-video').addEventListener('change', processInputVideoFile, false);
  $('#file-overlay').on('click', 'div', function(){
    $('#js-coment input').val(null);
    $('#input-video').trigger('click');
  });
  player.on('pause', function(){
    $('#file-overlay').animate({left: "0px"},500);
  })
  player.on('play', function(){
    $('#file-overlay').animate({left: "-260px"},500);
  });
  user_cue_active();
  $('#log-off').on('click', function(){
    var request = $.post('/logout')
    request.done(function(){
      user_current = null;
      location.reload();
    });
  });
}

function enter_the_web(){
  $('#logo').text('Object.call('+current_user.nickname+')');
  $('#lema').addClass('hidden');
  $('#log-off').show();
  reset_inputs_fields();
  $('canvas').fadeOut(2000);
  $('#sign').fadeOut(800);
  $('.log-in').css('display', 'none');
  $('#div-video').removeClass('disabled');
  $('#file-overlay').delay(2300).fadeIn(700).animate({left: "0px"}, 500);
  see_videos();
}

$(document).on('ready', function(){
  var request = $.get('/current_session')
  player = videojs('videoplayer');
  player.muted(true);
  request.done(function(response){
    current_user = response;
    player_ready();
    $('#lema').hide();
    $('#file-overlay').delay(5000).fadeIn(500).animate({left: "0px"}, 500);
    see_videos();
  });
  request.fail(function(){
    render_login_canvas();
    player_ready();
    form_ready();
  });
});
