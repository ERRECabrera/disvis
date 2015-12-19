class Video < ActiveRecord::Base
  has_many :cues

  after_initialize :default_values

  validates :md5, :duration, :videotype, presence: true
  validates :duration, numericality: true
  validates :md5, length: {is: 32}
  validates :videotype, inclusion: {in: %w{unknown trailer movie comercial documentary videoclip videoart news report videoblog viral sexy}}
  validates :md5, format: { with: /[0-9a-fA-F]/}
  validate :format_video_and_audio_src

  def self.generate_video_login(user=nil)
    if user == nil
      Video.all.where('videotype IN (?)', %w{trailer sexy news videoclip comercial videoart}).order('RANDOM()').first
    elsif user.gender == 'male'
      Video.all.where('videotype IN (?)', %w{trailer sexy news}).order('RANDOM()').first
    elsif user.gender == 'female'
      Video.all.where('videotype IN (?)', %w{videoclip comercial videoart}).order('RANDOM()').first
    end      
  end

  def self.get_video_with_checkmd5(md5,duration=nil)
    videos = Video.where(md5: md5)
    if videos.size == 1
      return videos.first
    elsif videos.size == 0
      new_video = Video.create(md5: md5, duration: duration)
      new_video.save
      self.get_video_with_checkmd5(md5)
    end
  end

private

  def default_values
    self.videotype ||= 'unknown'
  end

  def format_video_and_audio_src
    reg_exp = /\Ahttp(s|):\/\/.+/
    if self.videosrc
      unless self.videosrc =~ reg_exp
        errors.add :text, "video source is not permited"
      end
    end
    if self.audiosrc
      unless self.audiosrc =~ reg_exp
        errors.add :text, "audio source is not permited"
      end
    end
  end
   
end
