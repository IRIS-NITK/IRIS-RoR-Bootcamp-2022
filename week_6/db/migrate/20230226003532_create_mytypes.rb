class CreateMytypes < ActiveRecord::Migration[6.1]
  def change
    create_table :mytypes do |t|
      t.string :man

      t.timestamps
    end
  end
end
