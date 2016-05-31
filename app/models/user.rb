class User < ActiveRecord::Base
  # Include default devise modules.
  has_many :user_responses
  has_many :questions, through: :user_responses
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
          # :confirmable,
         # :omniauthable
  include DeviseTokenAuth::Concerns::User

  # def as_json(options = {})
  #  super({ expect: [:name] }.merge(options || {}))
  # end

  def as_json(options={})
    super(:only => [:email, :uid, :encrypted_password, :last_sign_in_ip, :id])
  end

end
