require 'rails_helper'

RSpec.describe SiteController, type: :controller do

  describe '1. routing' do

    it 'a. get route to website root' do
      video = Video.create(md5: '5df9f63916ebf8528697b629022993e8', duration: 10.1, videotype: 'trailer', videosrc: 'http://www.videos.com/video.mp4', audiosrc: 'http://www.videos.com/audio.mp3')
      video.save
      video = Video.last
      get :home
      expect(response).to render_template(:home)
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
    
  end

end

RSpec.describe SiteController, type: :request do

  describe '1. control REQUESTS' do

    it 'a. get route to website root' do
      get root_path
      #data = JSON.parse(response.body)
      
    end
    
  end

end