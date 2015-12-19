function user_cue_active(){

  $('#js-coment').bind('focusin', 'input', function(){
    player.pause();
    var input = '';
    new_cue = new VTTCue(0, player.duration(), input);
    new_cue.id = current_user.nickname;
    new_cue.align = 'start';
    new_cue.line = 80;
    new_cue.size = 40;

    track.addCue(new_cue);

    $('#js-coment').on('keyup', 'input', function(event){
      input = $(event.currentTarget).val(); 
      if (input.length > 74){
        $('#sad').attr('placeholder', 'Máximum: 74 characters');
        $('#sad').css('background-color', 'crimson');
        while(input.length > 74){
          var recut = input.substring(0,input.length-1);
          input = recut;
        };
        $(event.currentTarget).val(recut);
      };
      new_cue.text = '<c.'+cue_class+'>'+input+'</>';;
    });

    $('#js-coment').on('focusout', 'input', function(){
      $('#sad').attr('placeholder', '');
      $('#sad').css('background-color', 'white');
      track.removeCue(new_cue);
      $('#js-coment input').val(null);
      $('#input-coment').addClass('disabled');
      $('#love').css('background-color', 'white');
      player.play();
    });

    $('#js-coment').on('keydown', 'input', function(event){
      if (event.keyCode == 46){
        $('#js-coment input').val(null);
      };
      if (event.keyCode == 13){
        event.preventDefault();
        var cue = {
          starttime: (player.currentTime()).toFixed(3),
          text: $('#js-coment input').val(),
          cueid: current_user.nickname,
          cssclass: cue_class,
          position: 'line:90 align:end'
        };
        var token = $('#cue_token').val();
        var datas = {utf8: "✓", authenticity_token: token, cue: cue, commit: "Cue up"};
        $.ajax({
            url: '/post_cues',
            type: 'post',
            dataType: 'json',
            success: function(data){
              $('#sad').attr('placeholder', '');
              $('#sad').css('background-color', 'white');
              user_cue = render_user_cue(new_cue);
              track.addCue(user_cue);
              track.removeCue(new_cue);
              $('#love').css('background-color', 'white');
              $('#js-coment input').val(null);
              player.play();
            },
            fail: function(data){
              $('#sad').attr('placeholder', 'Sorry, try again');
              $('#sad').css('background-color', 'crimson');
              setTimeout(function(){
                $('#sad').attr('placeholder', '');
                $('#sad').css('background-color', 'white');
              }, 10000);
            },
            data: datas
        });
      };
    });
    icons_styles();
  });
}

function icons_styles(){
  $('#icons').on('click', 'img', function(event){
    $('#js-coment').off();
    $(this).addClass('animated pulse');
    player.pause();
    cue_class = $(event.currentTarget).attr('name');
    $(this).one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
      $(this).removeClass('animated pulse');
    });
    $('#input-coment').removeClass('disabled');
    $('#like').css('background-color', 'white');
    $('#love').css('background-color', 'seagreen');
    user_cue_active();
  });
};

function coments_box(){
  var b_width = $(window).width();
  $('#input-coment').css('width', ''+(b_width-10)+'')
  $('#js-coment').fadeIn(4000);
  $('#icons').fadeIn(4000);
  icons_styles();
}