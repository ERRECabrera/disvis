class AddEndtimeToCues < ActiveRecord::Migration
  def change
    add_column :cues, :endtime, :float
  end
end
