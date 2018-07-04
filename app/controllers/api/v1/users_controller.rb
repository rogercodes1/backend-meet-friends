class Api::V1::UsersController < ApplicationController
  # before_action :requires_login, only: [:index]
  # before_action :requires_user_match, only: [:show]

  def index
    @users = User.all
    render json: @users
  end

  def create
    byebug
    @user = User.new(get_params)
    @user.email = params[:email]
    @user.password = params[:password]
    if (@user.save)
      token = generate_token
      
      render json: {
        message: "You have been registed",
        token: token,
        id: @user.id,
        status: :accepted
        }
    else
      render json: {
         errors: @user.errors.full_messages},
         status: :unprocessable_entity
    end

  end


  def show
    @user = User.find(params[:id])
    render json: @user, include: :events
  end


  private

  def get_params
    params.permit(:first_name, :last_name, :email, :password, :birthday, :gender,)

  end
end
