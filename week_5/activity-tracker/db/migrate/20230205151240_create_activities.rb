class CreateActivities < ActiveRecord::Migration[7.0]
  def change
    create_table :activities do |t|
      t.string :title
      t.string :activity_type
      t.datetime :start
      t.decimal :duration
      t.integer :calories

      t.timestamps
    end
  end
end
