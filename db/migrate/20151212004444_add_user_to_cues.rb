class AddUserToCues < ActiveRecord::Migration
  def change
    add_reference :cues, :user, index: true, foreign_key: true
  end
end
