var validation = {
  nick: function(nickname){
    if (nickname.length == 0){
      $('#nick').css('background-color', 'crimson');
      $('#nick').attr('placeholder','put one chars min.');
      return false;
    }else{
      $('#nick').css('background-color', 'gray');
      return true;
    }
  },
  email: function(email){
    if ((/\w+@\w+\.\w{2,3}/).test(email)){
      $('#email').css('background-color', 'hotpink');
      return true;
    }else{
      $('#email').css('background-color', 'crimson');
      $('#email').attr('placeholder','incorrect email');
      return false;
    }
  },
  password: function(password){
    if (password.length < 8){
      $('#password').css('background-color', 'crimson');
      $('#password').val(null);
      $('#password').attr('placeholder','8 characters min.');
      return false;
    }else{
      $('#password').css('background-color', 'white');
      return true;
    }
  },
}

function validation_user(nick,email,password){
  if (validation.nick(nick)){
    if (validation.email(email)){
      if (validation.password(password)){
        return true;
      };   
    };
  };  
};

function reset_inputs_fields(){
  $('#nick').val(null);
  $('#nick').attr('placeholder','Nickname');
  $('#email').val(null);
  $('#email').attr('placeholder','Email');
  $('#password').val(null);
  $('#password').attr('placeholder','Password');
}

function form_ready(){
  $('#sign').on('click', 'img', function(event){
    var genders = document.querySelectorAll('#sign img');
    for (var i = 0; i <= 1; i++){
      $(genders[i]).toggleClass('checked');
      if ($(genders[i]).attr('style') == 'outline: rgb(153, 255, 255) solid 2px;'){
        $(genders[i]).css('outline', 'none');
      }else{
        $(genders[i]).css('outline', 'solid 2px #9ff');
      };
    };
  });

  $('#sign').on('click',' span', function(event){
    var nick = $('#nick').val();
    var email = $('#email').val();
    var password = $('#password').val();
    var gender = $('img.checked')[0].title
    var token = $('#token').val();
    
    if (event.currentTarget.id == 'sign-in'){
      if (validation_user(nick,email,password)){
        var user = {
          nickname: nick,
          email: email,
          password: password,
          password_confirmation: password,
          gender: gender,
        }
        var data = {utf8: "✓", authenticity_token: token, user: user, commit: "Sign up"}
        var request = $.post("/login", data);
        request.done(function(response){
          current_user = response;
          enter_the_web();
        })
        request.fail(function(){
          $('#error p').text("Wrong password or we don't have any users like you. Try again or Sign Up!!");
          $('#error').fadeIn(500);
        })
      };  
    };
    if (event.currentTarget.id == 'register'){
      if (validation_user(nick,email,password)){
        var user = {
          nickname: nick,
          email: email,
          password: password,
          password_confirmation: password,
          gender: gender,
        }
        var data = {utf8: "✓", authenticity_token: token, user: user, commit: "Sign in"};
        var request = $.post("/signin", data)
        request.done(function(response){
          current_user = response;
          enter_the_web();
        })
        request.fail(function(){
          $('#error p').text('May be, that we got someone with the same nickname and/or email !!');
          $('#error').fadeIn(500);
          $('#email').css('background-color', 'crimson');
          $('#nick').css('background-color', 'brown');
        })
      };
    }; 
  });
}