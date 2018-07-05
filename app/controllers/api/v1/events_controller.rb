class Api::V1::EventsController < ApplicationController
  def index
    render json: Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.save
    @user_event = UserEvent.new(user_id: params[:host_id],event_id: @event.id )

    if (@user_event.save)
      render json: {
        message: "event successfully created",
        id: @event.id,
        status: :success,
        data: @event,
        }
    else
      render json: {
         errors: @event.errors.full_messages},
         status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end
  
  private
  def event_params
    params.permit(
      :event_name,
      :location_name,
      :address,
      :description,
      :date,
      :time,
      :duration,
      :friends,
      :host_id,
      :yelp_url,
      :maps_link,
      :yelp_image,)

  end
end
