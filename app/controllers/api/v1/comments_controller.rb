class Api::V1::CommentsController < ApplicationController
  def index
    @comments = Comment.all

    render json: @comments
  end

  def create
    byebug
    @comment =Comment.new(comment_params)
    byebug
    if @comment.save
      @event = Event.find(@comment.id)
      byebug
      render json: {
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
