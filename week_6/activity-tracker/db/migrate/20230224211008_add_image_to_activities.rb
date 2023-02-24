class AddImageToActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :image, :string
    add_index :activities, :image, unique: true
  end
end
