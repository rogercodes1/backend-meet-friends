class Api::V1::CommentsController < ApplicationController
  def index
    render json: Comment.all
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      @event = Event.find(@comment.event_id)
      render json: {
        data: @event,
        comments: @event.comments,
        status: :success
      }
    else
      render json: {
         errors: @comment.errors.full_messages},
         status: :unprocessable_entity
    end

  end

  def show
  end

  def edit
  end

  private

  def comment_params
    params.permit(:event_id, :user_id, :comment)
  end


end
