class RenameUserPasswordColumn < ActiveRecord::Migration
  def up
  	rename_column :users, :password, "password-digest"
  end

  def down
  end
end
