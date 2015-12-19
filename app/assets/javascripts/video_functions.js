/*function set_cue_message(text){
  var textcue = '<c.info> '+text+' </c>'
  system_cue = new VTTCue(player.currentTime(), player.currentTime()+0.001, textcue);
  system_cue.id = 'system';
  system_cue.align = 'middle';
  system_cue.line = 50;
  system_cue.size = 100;
  track.addCue(system_cue);
};*/

function render_user_cue(cue){
  cue.starttime = player.currentTime();
  cue.endtime = cue.starttime + (cue.text.split(' ').length*3.0);     
  user_cue = new VTTCue(cue.starttime, cue.endtime, cue.text);
  user_cue.id = cue.id;
  user_cue.align = 'end';
  user_cue.line = 90;
  user_cue.size = 60;
  return user_cue;
};

function updateSrcAtribute(){
  //var path_video = $('#input-video').val();
  var video_file = document.getElementById('input-video').files[0];  
  //var videoplayer = document.getElementById('videoplayer'); this change because convention in videojs
  var videoplayer = videojs('videoplayer');
  var url_video = URL.createObjectURL(video_file);
  //videoplayer.src = url_video; this change because convention in videojs
  videoplayer.src(url_video);
  player.currentTime(0);
  player.pause();
  $('#loading-gif').show();
  //set_cue_message('waiting to load your file..');
  return url_video;
};

function process_position(position_ddbb){
  var arr = position_ddbb.split(' ');
  var line_string = arr.find(function(pos,index,array){if(/^l/.test(pos)){return pos}}) || '';
  var align_string = arr.find(function(pos,index,array){if(/^a/.test(pos)){return pos}}) || '';
  var line = parseInt(line_string.split(':')[1]);
  var align = align_string.split(':')[1];
  var position = {line: line, align: align};
  return position;
};

function set_cues(cue){
  var textcue = '<c.'+cue.cssclass+'> '+cue.text+' </c>';
  new_cue = new VTTCue(cue.starttime, cue.endtime, textcue);
  new_cue.id = cue.cueid;
  var position = process_position(cue.position);
  new_cue.align = position.align;
  new_cue.line = position.line;
  new_cue.size = 60;
  return new_cue;
};

function remove_track(){
  var track;
  for (var i=0;i<player.textTracks().length;i++){
    track = player.textTracks()[i];
    track.mode = 'hidden';
    for (var sub_i=0;sub_i<player.textTracks()[i].cues.length;sub_i++){
      old_cue = player.textTracks()[i].cues[sub_i];
      player.textTracks()[i].removeCue(old_cue);  
    }
  }
};

function load_track(){
  count_tracks++;
  var new_track = player.addTextTrack('subtitles','coments'+count_tracks,'es');
  current_user.cues.forEach(function(cue, index, current_user_cues){
    new_cue = set_cues(cue);
    new_track.addCue(new_cue);
  });
  player.currentTime(player.duration());
  player.play();
  $('#loading-gif').hide();
  new_track.mode = 'showing';
};

function get_metadatas_video_from_server(hash){  
  var request = $.post('/video', {video: {md5: hash, duration: player.duration()}});
  request.done(function(response){
    current_user.cues = response;
    load_track();
  });
};

function get_md5_hash_video(){
  var hash_md5 = null;

  var blobSlice = File.prototype.slice || File.prototype.mozSlice || File.prototype.webkitSlice,
    file = document.getElementById('input-video').files[0],
    chunkSize = 2097152,                             // Read in chunks of 2MB
    chunks = Math.ceil(file.size / chunkSize),
    currentChunk = 0,
    spark = new SparkMD5.ArrayBuffer(),
    fileReader = new FileReader();

  fileReader.onload = function (e) {
    console.log('read chunk nr', currentChunk + 1, 'of', chunks);
    spark.append(e.target.result);                   // Append array buffer
    currentChunk++;

    if (currentChunk < chunks) {
        loadNext();
    } else {
        console.log('finished loading');
        //console.info('computed hash', spark.end());  // Compute hash
        hash_md5 = spark.end();
        get_metadatas_video_from_server(hash_md5);
    }
  };

  fileReader.onerror = function () {
    console.warn('oops, something went wrong.');
  };

  function loadNext() {
    var start = currentChunk * chunkSize,
        end = ((start + chunkSize) >= file.size) ? file.size : start + chunkSize;

    fileReader.readAsArrayBuffer(blobSlice.call(file, start, end));
  }

  loadNext();
};

function processInputVideoFile(){
  $('#js-coment').off();
  $('#file-overlay').animate({left: "-260px"},500);
  if (player.textTracks().length > 0){
    remove_track();
  };
  updateSrcAtribute();
  get_md5_hash_video();
  coments_box();
  user_cue_active();
  document.getElementById('input-video').value = null
};