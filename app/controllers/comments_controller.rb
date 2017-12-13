class CommentsController < ApplicationController
  layout "site"

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render json: { errors: @comment.errors.full_messages }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :juice_id, :content)
  end
end
