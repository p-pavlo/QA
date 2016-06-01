class Api::V1::UsersController < ApplicationController
  before_filter :find_user, except: [:index, :create]
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid,  with: :record_is_invalid


  def index
    @users = User.all #hello!
    render json: @users, status: 200
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: 201
    else
      render json: @user.errors
    end
  end

  def show
    if @user
      render json: @user, status: 200
    end
  end

  def destroy
    if @user
      @user.delete
      render json: {result: "Your user was successfuly deleted"}, status: 200
    end
end

private

def find_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(:name, :email, :password)
end

def record_not_found
  render json: {error: "User is not found"}, status: 404
end

def record_is_invalid
  render json: {}, status: 422
end
end