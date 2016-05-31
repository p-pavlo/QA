class Api::V1::UserResponsesController < ApplicationController
  before_action :authenticate_user!

  rescue_from ActiveRecord::InvalidForeignKey, with: :invalid_foreign_key

  def index

    #binding.pry
    @user_responses = UserResponse.all
    render json: @user_responses, status: 200
  end

  def create
    #Question.find(user_response_params[:user_id])
    #user
    #binding.pry
     @user_response = UserResponse.new(user_response_params)
      if @user_response.response.upcase == @user_response.question.answer && @user_response.save
        render json: "Congratulations (#{@user_response.response}) is correct answer :) !", status: 201
      elsif @user_response.response.upcase != @user_response.question.answer && @user_response.save
        render json: "Sorry,  (#{@user_response.response}) is not correct answer :(  Correct answer is  (#{@user_response.question.answer}) ", status: 201
      else
        render json:  {error: "Something is wrong"}, status: 422
      end
  end

  private

  def user_response_params
    params.require(:user_response).permit(:user_id, :question_id, :response)
  end

  def invalid_foreign_key
    render json: {error: "Invalid foreign key"}, status: 404
  end
end
