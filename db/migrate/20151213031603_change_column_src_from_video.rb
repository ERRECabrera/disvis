class ChangeColumnSrcFromVideo < ActiveRecord::Migration
  def change
    rename_column :videos, :src, :videosrc
  end
end
