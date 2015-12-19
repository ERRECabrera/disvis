class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :md5
      t.string :videotype
      t.text :src

      t.timestamps null: false
    end
  end
end
