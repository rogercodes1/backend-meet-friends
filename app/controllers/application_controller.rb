class ApplicationController < ActionController::Base
   protect_from_forgery with: :null_session

    def get_secret
      ENV['JWT_SECRET']
    end
    def yelp_secret
      ENV['YELP_API_KEY']

    end

    def generate_token
    # We will make a token here!
    payload = {
      email: @user.email,
      id: @user.id
    }
    # IMPORTANT: set nil as password parameter
    JWT.encode payload, get_secret, 'HS256'
    end

   def get_token
     byebug
      request.headers['Authorization']
   end

   def get_decoded_token
     token = get_token()
     byebug
      begin
         decoded_token = JWT.decode token, get_secret(), true, {algorithm: 'HS256'}
         byebug
      rescue JWT::DecodeError
         nil
      end
      decoded_token
   end

   def is_authenticated?
      !!get_decoded_token
   end

  def requires_login
    if !is_authenticated?
      render json: {
         message: 'No Auth',
         status: :unauthorized}
    end
  end

  def requires_user_match

    @user = User.find(params[:id])
    byebug
    if @user.id != get_decoded_token[0]["id"]
      byebug
      render json:{
        message: "Not your transactions",
        status: :unauthorized}
    end

  end


#   def requires_user_match
#   @user = User.find_by(id: params[:user_id])
#   byebug
#   if @user.id !== get_decoded_token[0]["id"]
#     render json: {
#       message: "Not your snacks!!!!!! Treat yourself!"
#     }, status: :unauthorized
#   end
# end

  # def require_user_match
  #   if @user_tr.id ==
  #   #code
  # end



end
