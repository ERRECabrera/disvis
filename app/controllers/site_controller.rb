class SiteController < ApplicationController

  def current_session
    if current_user
      cues = Cue.get_with_filter(current_video,7)
      datas = inject_datas(current_user,cues)
      render status: 200, json: ActiveSupport::JSON.decode(datas)
    else
      render status: 404, json: {error: "Error with current_user"}
    end
  end

  def home
    video = Video.generate_video_login(current_user)
    session[:video_id] = video.id
    render 'home'
  end

  def create_user
    user = User.create(user_params)
    if user.save
      session[:user_id] = User.last.id
      cues = Cue.get_with_filter(current_video,7)
      datas = inject_datas(user,cues)
      render status: 201, json: ActiveSupport::JSON.decode(datas)
    else
      render status: 404, json: {error: "Error registration"}
    end
  end

  def login
    user = User.where('nickname = ? AND email = ?', params.require(:user).permit(:nickname)[:nickname], params.require(:user).permit(:email)[:email])
    if user.any? && user[0].authenticate(params.require(:user).permit(:password)[:password])
      session[:user_id] = user[0].id
      cues = Cue.get_with_filter(current_video,7)
      datas = inject_datas(user[0],cues)
      render status: 200, json: ActiveSupport::JSON.decode(datas)
    else
      render status: 404, json: {error: "Error login"}
    end
  end

  def logout
    session[:user_id] = nil
    current_user = nil
    render status: 200, json: current_user
  end

  def video_and_cues_ddbb
    hash = params.require(:video).permit(:md5)[:md5]
    duration = params.require(:video).permit(:duration)[:duration]
    video = Video.get_video_with_checkmd5(hash,duration)
    session[:video_id] = video.id
    cues = Cue.get_with_filter(video,7)
    render status: 200, json: cues
  end

  def create_cue
    cue = Cue.create(user_id: current_user.id, video_id: current_video.id, starttime: params.require(:cue).permit(:starttime)[:starttime], text: params.require(:cue).permit(:text)[:text], cueid: params.require(:cue).permit(:cueid)[:cueid], cssclass: params.require(:cue).permit(:cssclass)[:cssclass], position: params.require(:cue).permit(:position)[:position])
    if cue.save
      render status: 201, json: Cue.last
    else
      render status: 404, json: {error: "Error: no create cue"}
    end
  end

private
  
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :gender)  
  end

  def video_params
    params.require(:video).permit(:md5, :duration)
  end

end
