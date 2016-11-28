class CommentsController < ApplicationController

  def create
    binding.pry
    @comment = Comment.new(comment_params)

  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :juice_id, :content)
    end
end
