class AddEndtimeroundToCue < ActiveRecord::Migration
  def change
    add_column :cues, :endtimeround, :integer
  end
end
