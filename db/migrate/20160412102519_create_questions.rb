class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :user_responses do |t|
      t.integer :question_id
      t.integer :user_id
  end
  end
  end
