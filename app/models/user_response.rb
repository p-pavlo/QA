class UserResponse < ActiveRecord::Base
  belongs_to :user
  belongs_to :question

 # VALID_RESPONSE_REGEX = /[A-D]/i
  validates :response, presence: true
 #           format: { with: VALID_RESPONSE_REGEX }
end
