class Addforeigntoactivity < ActiveRecord::Migration[6.1]
  def change
    add_reference :activities, :user, foreign_key: true
  end
end
