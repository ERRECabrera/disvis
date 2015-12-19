context = describe;

describe('1. when load video_file', function(){

  var view_test = 'videoplayer_input.html';
  var url_video = 'http://techslides.com/demos/sample-videos/small.ogv'

  beforeEach(function(){
    
  });

  //No funciona [URL.createObjectURL] después de instalar librería VideoJs
  /*it('a. take a valid url from video_file and update video.src atribute = load_video', function(){
    loadFixtures(view_test);

    var video_file = new File([''],'my_file', {type: "video/mp4"});
    video_file.webkitRelativePath = url_video;
    
    var video = $('#input-video');
    video[0].files[0] = video_file;
    var objectUrl = null;
    video.change(function(){
      objectUrl = updateSrcAtribute();
    });
    video.triggerHandler('change');
    
    var videoplayer = videojs('videoplayer');
    expect(videoplayer.src).toEqual(objectUrl);
  });*/

  /*it('b. ', function(){
    
  });*/

});