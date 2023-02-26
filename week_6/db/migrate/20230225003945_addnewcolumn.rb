class Addnewcolumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :activities, :type
    add_column :activities, :activetype, :string
  end
end
