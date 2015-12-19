class RemoveEndtimeroundFromCue < ActiveRecord::Migration
  def change
    remove_column :cues, :endtimeround, :integer
  end
end
