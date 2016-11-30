class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: 201
    else
      # respond_to do |format|
      #   format.js { flash.now[:alert] = "Please fill in comment box" }
      # end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :juice_id, :content)
  end
end
