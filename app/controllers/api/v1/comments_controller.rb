class Api::V1::CommentsController < ApplicationController
  def index
    byebug
    @comments = Comment.all

    render json: @comments
  end

  def create
    byebug

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
