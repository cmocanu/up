class RepairDumbType < ActiveRecord::Migration
  def up
  	rename_column :users, "password-digest", "password_digest"
  end

  def down
  end
end
