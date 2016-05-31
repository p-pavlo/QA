class CreateUserResponses < ActiveRecord::Migration
  def up
    create_table :user_responses do |t|
      t.integer :question_id
      t.integer :user_id
      t.boolean :response
      t.timestamps null: false
    end
    drop_table :questions_users
  end
end
