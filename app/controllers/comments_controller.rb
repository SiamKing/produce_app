class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    binding.pry

    render json: @comment, status: 201
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :juice_id, :content)
    end
end
