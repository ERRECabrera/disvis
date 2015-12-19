require 'rails_helper'

RSpec.describe Cue, type: :model do
  
  describe '1. create new CUE:' do

    it 'a. require VALIDS ATTRIBUTES and existence of USER & VIDEO references' do
      user_in_ddbbb = User.create(nickname: 'estela', email: 'estela@gmail.com', gender: 'female', role: 'user', password: '12345678')
      video_in_ddbb = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
      expect(Cue.create(user_id: 1, video_id: 1, starttime: 1.1, text: '- Esto es un comentario', cueid: 'prueba', cssclass: 'class', position: 'line:0 align:start').valid?).to eq(true)
    end
    
    describe 'b. VALIDATIONS, with invalid:' do

      it '- attribute PRESENCE (user_id, video_id, starttime, text, cssclass, endtime(method before_create))' do
        expect(Cue.create(user_id: 1, video_id: 1, starttime: nil, text: nil, cueid: 'da igual', cssclass: nil, position: 'da:0 igual:0').valid?).to eq(false)
        expect(Cue.create(user_id: nil, video_id: nil, starttime: 1.1, text: '- raule the world', cueid: 'da igual', cssclass: 'class', position: 'da:0 igual:0').valid?).to eq(false)
      end

      it '- attribute NUMERICALITY (user_id, video_id, starttime)' do
        expect(Cue.create(user_id: 1, video_id: 1, starttime: 'hola', text: '- Esto es un comentario', cueid: 'prueba', cssclass: 'class', position: 'line:0 align:start').valid?).to eq(false)
        expect(Cue.create(user_id: 'uno', video_id: '1',starttime: 1.1, text: '- Esto es un comentario', cueid: 'prueba', cssclass: 'class', position: 'line:0 align:start').valid?).to eq(false)
      end
      
      it '- attribute LENGTH (text:-74)' do
        expect(Cue.create(user_id: 1, video_id: 1, starttime: 1.1, text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ultricies ipsum quis laoreet sodales. Donec sem tellus, molestie ac enim.', cueid: 'da igual', cssclass: 'da_igual', position: 'da:0 igual:0').valid?).to eq(false)
      end

      it '- attribute FORMAT (position)' do
        expect(Cue.create(user_id: 1, video_id: 1, starttime: 1.1, text: '- Esto es un comentario', cueid: 'prueba', cssclass: 'class', position: 'line:A 100:').valid?).to eq(false)
      end
    
      it '- attribute FORMAT EXCLUSION, method manual (text)' do      
        expect(Cue.create(user_id: 1, video_id: 1, starttime: 1.1, text: 'a-->a&a<a>a', cueid: 'prueba', cssclass: 'class', position: 'line:0 align:start').valid?).to eq(false)
      end

    end

    it 'c. with method ADD_CUE' do
      currentUser = User.create(nickname: 'estela', email: 'estela@gmail.com', gender: 'female', role: 'user', password: '12345678')
      currentVideo = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
      new_cue = {starttime: 1.1, text: '- Esto es un comentario', cueid: 'prueba', cssclass: 'class', position: 'line:0 align:start'}
      Cue.add_cue_to_ddbb(new_cue, currentUser, currentVideo)
      expect(Cue.last[:text]).to eq(new_cue[:text])
    end

    it 'd. generate dynamically cue.ENDTIME depending of number of words in cue.text' do
      user_in_ddbbb = User.create(nickname: 'estela', email: 'estela@gmail.com', gender: 'female', role: 'user', password: '12345678')
      video_in_ddbb = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
      new_cue = Cue.create(user_id: 1, video_id: 1, starttime: 1.1, text: '- Esto es un comentario', cueid: 'prueba', cssclass: 'class', position: 'line:0 align:start')
      expect(new_cue.endtime).not_to be_nil
    end

    it 'e. generate dynamically cue.STARTTIMEROUND' do
      user_in_ddbbb = User.create(nickname: 'estela', email: 'estela@gmail.com', gender: 'female', role: 'user', password: '12345678')
      video_in_ddbb = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
      new_cue = Cue.create(user_id: 1, video_id: 1, starttime: 1.1, text: '- Esto es un comentario', cueid: 'prueba', cssclass: 'class', position: 'line:0 align:start')
      expect(new_cue.starttimeround).not_to be_nil
    end

  end

  describe '2. CUE belongs to:' do

    it 'a. one VIDEO' do
      user = User.create(nickname: 'ruben', email: 'rubenn@gmail.com', gender: 'male', role: 'user', password: '12345678')
      user.save
      cues = user.cues.create(video_id: nil, starttime: 1.1, text: '- Esto es un comentario', cueid: 'prueba', cssclass: 'class', position: 'line:0 align:start')
      cues.save
      expect(Cue.all.empty?).to eq(true)
    end

    it 'b. one USER' do
      video = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
      video.save      
      cues = video.cues.create(user_id: nil, starttime: 1.1, text: '- Esto es un comentario', cueid: 'prueba', cssclass: 'class', position: 'line:0 align:start')
      cues.save
      expect(Cue.all.empty?).to eq(true)
    end

  end

  describe '3. get CUES:' do


    it 'a. MAX number of cues returned for every second AND videoplayer.position' do
      currentUser = User.create(nickname: 'estela', email: 'estela@gmail.com', gender: 'female', role: 'user', password: '12345678')
      currentVideo = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
      same_time = 1.1
      6.times do |number|
        previus_cue = {starttime: same_time, text: "- comentario #{number}", cueid: "prueba#{number}", cssclass: 'class', position: 'line:90 align:end'}
        Cue.add_cue_to_ddbb(previus_cue, currentUser, currentVideo)
      end
      cues_in_same_second = Cue.get_with_filter(currentVideo, 3)
      expect(cues_in_same_second.size).to eq(3)
    end



    it 'b. return also cues with time collision, between video.time_range' do
      currentUser = User.create(nickname: 'estela', email: 'estela@gmail.com', gender: 'female', role: 'user', password: '12345678')
      currentVideo = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
      previus_cue = {starttime: 1.1, text: '- Esto es un comentario', cueid: "prueba", cssclass: 'class', position: 'line:90 align:end'}
      Cue.add_cue_to_ddbb(previus_cue, currentUser, currentVideo)
      new_cue = {starttime: 3, text: '- Esto es un comentario', cueid: "prueba", cssclass: 'class', position: 'line:90 align:end'}
      cues_in_same_range_of_time = Cue.get_with_filter(currentVideo, 3)
      expect(cues_in_same_range_of_time.size).to eq(1)
    end

  end

end
