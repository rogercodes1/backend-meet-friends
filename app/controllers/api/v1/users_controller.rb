class Api::V1::UsersController < ApplicationController
  # before_action :requires_login, only: [:index]
  # before_action :requires_user_match, only: [:show]
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(get_params)
    @verify_user = User.find_by(email: params[:email])
    @user.email = params[:email]
    @user.password = params[:password]
    # if (@user.save)
    if (@verify_user === nil && @user.save )
      token = generate_token
      render json: {
        message: "You have been registed",
        token: token,
        id: @user.id,
        status: :accepted
        }
    elsif (@verify_user.valid?)
      render json: {
        message: "You already have an account",
         errors: @user.errors.full_messages,
         verify: @verify_user,
         status: :conflict}
    else
      render json: {
         errors: @user.errors.full_messages,
         status: :unprocessable_entity
       }

    end

  end

  def show
    @user = User.find(params[:id])
    # byebug
    render json: @user, include: [:events, :comments]
  end


  private

  def get_params
    params.permit(:first_name, :last_name, :email, :password, :birthday, :gender, :avatar)
  end
end
