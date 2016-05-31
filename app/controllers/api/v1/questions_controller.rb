class Api::V1::QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_question, except: [:index, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid,  with: :record_is_invalid

  def index
    @questions = Question.all
    render json: @questions, status: 200
  end

  def show
    if @question
      render json: @question, status: 200
    else
      render json: {error: "Question is not found"}, status: 404
    end
  end

  def create
    @question = Question.new(question_params)
    #@question.user = current_user
    if @question.save
      render json: @question,  status: 201
    else
      render json: @question.errors, status: 422
    end
  end

  def update
    @question.update(question_params)
    if @question.valid?
      render json: @question,  status: 200
    else
      render json: @question.errors, status: 422
    end
  end

  def destroy
    if @question
      @question.delete
      render json: {result: "Your question was successfuly deleted"}, status: 200
    else
      render json: {error: "Question is not found"}, status: 404
    end
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:question, :answer)
  end

  def record_not_found
    render json: {error: "Record is not found"}, status: 404
  end

  def record_is_invalid
    render json: {}, status: 422
  end
end
