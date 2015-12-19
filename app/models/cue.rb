class Cue < ActiveRecord::Base
  after_initialize :set_time_atributes

  belongs_to :user, validate: true
  belongs_to :video, validate: true

  validates :user, :user_id, :video, :video_id, :starttime, :endtime, :text, :cssclass, presence: true
  validates :user_id, :video_id, :starttime, numericality: true
  validates :text, length: {maximum: 74}
  validates :position, format: {with: /(\s|)\w+\:(\d+|\w+)(\s|)/}
  validate :text_without_reserved_words


  def self.add_cue_to_ddbb(cue, user, video)
    user = User.find_by_id(user.id)
    cues = user.cues.create(video_id: video[:id], starttime: cue[:starttime], text: cue[:text], cueid: cue[:cueid], cssclass: cue[:cssclass], position: cue[:position])
    cues.save
  end

  def self.get_with_filter(video, limit)
    max = limit
    arr_cue_ids = []
    positions = [
#      'line:20 align:start',
#      'line:20 align:end',
#      'line:90 align:start',
      'line:90 align:end'
#      'line:50 align:middle',
#      'line:50 align:start',
#      'line:50 align:end'
    ]
    positions.each do |position|
      arr_cue_ids += Cue.mapping_video_cues(video, max, position)
    end   
    arr_cue_ids_uniqs = arr_cue_ids.uniq
    cues = Cue.where('id IN (?)', arr_cue_ids_uniqs)
    return cues #array de cues
  end

  def self.mapping_video_cues(video, max, position)
    arr_cue_ids = []
    for sg in 0..video.duration.round
      sub_arr ||= []
      if sub_arr.include?(sg)
        sub_arr.delete(sg)
      end
      if sub_arr.size < max      
        limit = max - sub_arr.size
        video.cues.where('starttimeround = ? AND position = ?', sg, position).order(created_at: :asc).limit(limit).each do |cue|
          sub_arr << cue.endtime.round
          arr_cue_ids << cue.id
        end
      else
        next
      end
    end
    return arr_cue_ids
  end

private

  def text_without_reserved_words
    if self.text =~ /(-->|&|<|>)/
      errors.add :text, "not put reserved words('-->','&','<''>') in your comentary"
    end
  end

  def set_time_atributes
    if self.starttime
      self.starttimeround = self.starttime.round
    end
    if self.text != nil
      duration = self.text.split(' ').size*3.0
      self.endtime = self.starttime + duration
    end
  end

end
