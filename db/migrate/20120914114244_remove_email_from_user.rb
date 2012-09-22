class RemoveEmailFromUser < ActiveRecord::Migration
  def up
  end

  def down
  	remove_column :users, :email
  end
end
