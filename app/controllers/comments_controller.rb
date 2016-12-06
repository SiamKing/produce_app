class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      render json: @comment.errors
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :juice_id, :content)
  end
end
