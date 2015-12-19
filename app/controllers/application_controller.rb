class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :current_video

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])    
  end

  def current_video
    @current_video ||= Video.find_by(id: session[:video_id])
  end
  
  def inject_datas(user,cues)
    _user = ActiveSupport::JSON.encode(user)
    end_bracket = _user[-1]
    _user = _user.delete!(end_bracket)
    _cues = ",\"cues\":" + ActiveSupport::JSON.encode(cues) + end_bracket
    datas = _user + _cues
  end

end
