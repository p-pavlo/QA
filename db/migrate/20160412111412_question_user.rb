class QuestionUser < ActiveRecord::Migration
  def up
    create_table :questions_users, id: false  do |t|
      t.integer :question_id
      t.integer :user_id
    end
    drop_table :questions_users
  end
end
