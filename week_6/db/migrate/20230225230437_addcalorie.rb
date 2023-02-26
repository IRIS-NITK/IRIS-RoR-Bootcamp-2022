class Addcalorie < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :totald, :number
    add_column :users, :totalc, :number
  end
end
