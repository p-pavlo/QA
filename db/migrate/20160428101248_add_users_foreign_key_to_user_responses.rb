class AddUsersForeignKeyToUserResponses < ActiveRecord::Migration
  def change
    add_foreign_key :user_responses, :users, column:  :user_id
  end
end
