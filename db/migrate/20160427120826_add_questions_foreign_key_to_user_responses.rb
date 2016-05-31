class AddQuestionsForeignKeyToUserResponses < ActiveRecord::Migration
  def change
    add_foreign_key :user_responses, :questions, column:  :question_id
  end
end
