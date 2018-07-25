class ApplicationController < ActionController::Base
   protect_from_forgery with: :null_session
   # skip_before_action :verify_authenticity_token

  def get_secret
      ENV['JWT_SECRET']
  end

  def yelp_secret
      'Bearer '+ ENV['YELP_API_KEY']

  end

    def generate_token
    # We will make a token here!
    payload = {
      email: @user.email,
      id: @user.id
    }
    # IMPORTANT: set nil as password parameter
    JWT.encode payload, get_secret(), 'HS256'
    end

   def get_token
     puts "request #{request.headers['Authorization']}"
     byebug
      request.headers['Authorization']
   end

   def get_decoded_token
     token = get_token()
      begin
         decoded_token = JWT.decode token, get_secret(), true, {algorithm: 'HS256'}
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

  def nearby_events(user_id)
    event_ids = UserEvent.where(user_id: user_id).pluck(:event_id)
    if event_ids === []
      []
    else
      @nearby_events = Event.all.select do |event|
        event if !event_ids.include?(event.id)
       end
      @nearby_events
    end
  end



end
