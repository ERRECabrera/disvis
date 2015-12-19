class AddStarttimeroundToCue < ActiveRecord::Migration
  def change
    add_column :cues, :starttimeround, :integer
  end
end
