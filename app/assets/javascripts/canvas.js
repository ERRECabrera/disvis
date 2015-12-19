// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function render_login_canvas(){
  var c = document.getElementsByTagName("canvas");
  var ctx = c[0].getContext("2d");
  
  ctx.save();

  ctx.globalCompositeOperation = 'xor';

  var b_width = $(window).width();
  var b_height = 945;
  
  var font_size = 271.2;
  ctx.font = "bold "+font_size+"pt Abel";
  ctx.fillStyle = "#9ff";
  ctx.fillText("LOGIN",(b_width*0.069),(b_height/3));

  ctx.beginPath();
  ctx.moveTo((b_width*0.069)+25,(b_height/3)+50);
  ctx.lineTo((b_width*0.069)+806,(b_height/3)+50);
  ctx.lineWidth=1;
  ctx.stroke();

  ctx.fillStyle = "#e3f2ff";
  ctx.fillRect(0,0,b_width,(b_height*0.455));

  ctx.restore();
};

function enter_the_web(){
  $('#logo').text('Object.call('+current_user.nickname+')');
  reset_inputs_fields();
  $('canvas').fadeOut(1000);
  $('#sign').fadeOut(500);
  $('#div-video').removeClass('disabled');
  $('#file-overlay').delay(700).fadeIn(500);
}