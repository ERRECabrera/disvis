require 'rails_helper'

RSpec.describe Video, type: :model do
  
  describe '1. create new VIDEO:' do

    it 'a. with VALIDS ATTRIBUTES' do      
      expect(Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3').valid?).to eq(true)
    end
    
    describe 'b. VALIDATIONS, with invalid:' do

      it '- attribute PRESENCE (md5, videotype)' do
        expect(Video.create(md5: nil, duration: nil, videotype: nil, videosrc: 'http://www.noimporta.com/video.mp4', audiosrc: 'http://www.noimporta.com/audio.mp3').valid?).to eq(false)
      end

      it '- attribute NUMERICALITY (user_id, video_id, starttime)' do
        expect(Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 'a', videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3').valid?).to eq(false)
      end

      it '- attribute LENGTH (md5:32)' do
        expect(Video.create(md5: '5df9f', duration: 10.1, videotype: 'movie', videosrc: 'http://www.noimporta.com/video.mp4', audiosrc: 'http://www.noimporta.com/audio.mp3').valid?).to eq(false)
      end

      it '- attribute INCLUSION options predefined (videotype:trailer/movie/comercial/videoclip/videoarte..)' do
        expect(Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'chair', videosrc: 'http://www.noimporta.com/video.mp4', audiosrc: 'http://www.noimporta.com/audio.mp3').valid?).to eq(false)
      end

      it '- attribute FORMAT (md5), (videosrc and audiosrc) with method manual' do
        expect(Video.create(md5: 'z1y2x3w4v5u6t7s8r9q0p,o.ñ:n$m#l@', duration: 10.1, videotype: 'news', videosrc: 'café:-/-/www.videos.com/video.mp4', audiosrc: 'leche&ñw.videos.com/audio.mp3').valid?).to eq(false)
      end

    end

    describe 'c. set DEFAULT VALUES:' do

      it '- to video.videotype attribute is "unknown"' do
        video = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: nil, videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
        expect(video.videotype).not_to be(nil)
      end
      
    end

  end
  describe '2. get a VIDEO' do
    
    describe 'a. generate RANDOM video to web login' do

      it '- get VIDEOS with video.videosrc&audiosrc attribute' do
        video1 = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
        video2 = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: '', audiosrc: '')
        videos = Video.where.not(videosrc: nil).where.not(audiosrc: nil)
        expect(videos.size).to eq(1)
      end

      describe '- get VIDEO with a basic gender market segmentation:' do

        it 'when user is a MALE' do
          Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'sexy', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
          male = User.create(nickname: 'robin', email: 'robin@gmail.com', gender: 'male', role: 'user', password: '12345678')
          video = Video.generate_video_login(male)
          expect(['trailer','sexy','news']).to include(video.videotype)
        end

        it 'when user is a FEMALE' do
          Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'comercial', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
          female = User.create(nickname: 'susi', email: 'susi@gmail.com', gender: 'female', role: 'user', password: '12345678')
          video = Video.generate_video_login(female)
          expect(['videoclip','comercial','videoart']).to include(video.videotype)
        end

        it 'when user gender is unknown, the user is not login' do
          Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'comercial', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
          video = Video.generate_video_login()
          expect(['videoclip','comercial','videoart','trailer','sexy','news']).to include(video.videotype)
        end

      end
    end

    describe 'b. get a VIDEO from DDBB:' do

      it '- when video.MD5 attribute EXIST in DDBB' do
        md5 = '5df9f63916ebf8528697b629022993e8'
        video_previus = Video.create(md5: md5, duration: 10.1, videotype: 'comercial', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
        video_previus.save
        video = Video.get_video_with_checkmd5(md5)
        expect(video.md5).to eq(md5)
      end
      
      it '- when video.MD5 attribute NOT EXIST in DDBB, we need create new registry' do
        video_previus = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'comercial', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
        video_previus.save
        new_md5 = '6df9f63916ebf8528697b629022993e8'
        new_video = {md5: new_md5, duration: 10.1}
        video = Video.get_video_with_checkmd5(new_video[:md5],new_video[:duration])
        expect(video.md5).to eq(new_md5)
      end

    end
  end

end
