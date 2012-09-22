class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :karma, null: false, default: '0'

      t.timestamps
    end
  end
end
