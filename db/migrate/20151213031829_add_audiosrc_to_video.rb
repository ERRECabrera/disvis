class AddAudiosrcToVideo < ActiveRecord::Migration
  def change
    add_column :videos, :audiosrc, :string
  end
end
