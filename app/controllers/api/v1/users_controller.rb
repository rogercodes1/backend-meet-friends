class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
  end

  def show
  end

  def edit
  end

private

  def user_params
    param.permit(
      :first_name,
      :last_name,
      :email,
      :password
     )

  end

end
