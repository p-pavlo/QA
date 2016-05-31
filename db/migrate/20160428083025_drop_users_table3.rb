class DropUsersTable3 < ActiveRecord::Migration
  def up
    drop_table :users, force: :cascade
  end
end
