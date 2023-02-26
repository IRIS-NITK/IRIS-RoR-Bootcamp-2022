class CreateActivitytypes < ActiveRecord::Migration[6.1]
  def change
    create_table :activitytypes do |t|
      t.string :acttype

      t.timestamps
    end
  end
end
