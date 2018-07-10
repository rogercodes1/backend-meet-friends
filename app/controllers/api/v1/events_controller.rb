class Api::V1::EventsController < ApplicationController

  def index
    @events = Event.all
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
    @event = Event.find(params[:id])
    render json: @event, include: [:users,:comments]
  end

  def edit
  end

  def join_event
    @joined = UserEvent.find_or_create_by(join_params)
    if (@joined.valid?)
      # @event = Event.find(@joined.event_id)
      user = User.find(@joined.user_id)
      other_events = nearby_events(user.id)

      render json:{
        data: user.events,
        nearby: other_events,
        status: :accepted,
      }
    else
      render json: {
         errors: @user.errors.full_messages,
         status: :unprocessable_entity
       }
    end


  end

  def nearby
    event_ids = UserEvent.where(user_id: params[:id]).pluck(:event_id)

    if event_ids === []
      render json: Event.all
    else
      @nearby_events = Event.all.select do |event|
        event if !event_ids.include?(event.id)
       end
      render json: @nearby_events
    end

  end

  def comments
    #Need full event with nested comments
    # data so they be used on frontEnd
    @event = Event.find(params[:id])

    render json: @event
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
    :yelp_image
  )
  end


  def join_params
    params.permit(:event_id, :user_id)
  end
end
