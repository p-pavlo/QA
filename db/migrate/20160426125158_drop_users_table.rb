class DropUsersTable < ActiveRecord::Migration
  def up
    drop_table :users
  end

  def down
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :password
      t.timestamps null: false
    end
  end
end
