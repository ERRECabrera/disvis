class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :cues, :startime, :starttime
  end
end
