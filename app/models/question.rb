class Question < ActiveRecord::Base
  has_many :user_responses
  has_many :users, through: :user_responses
  validates :question, presence:  true, allow_nil: false

  def as_json(_options = {})
    {
        id: id,
        question: question,
        answer: answer
    }
  end
end
