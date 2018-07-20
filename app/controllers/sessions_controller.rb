class SessionsController < ApplicationController
  def create
   puts "#{params}"
    @user = User.find_by(email: params['email'])
    if @user && @user.authenticate(params['password'])
      token = generate_token
      render json: {
        events:@user.events,
        id: @user.id,
        token: token,
        status: :accepted
      }
    else
      render json: {
        errors: 'Login credentials are incorrect, Try again.',
        status: :unauthorized
      }
    end
  end
end
