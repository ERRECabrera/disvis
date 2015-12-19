class AddVideoToCues < ActiveRecord::Migration
  def change
    add_reference :cues, :video, index: true, foreign_key: true
  end
end
