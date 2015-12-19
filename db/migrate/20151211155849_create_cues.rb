class CreateCues < ActiveRecord::Migration
  def change
    create_table :cues do |t|
      t.float :startime
      t.string :text
      t.string :cueid
      t.string :cssclass
      t.string :position

      t.timestamps null: false
    end
  end
end
