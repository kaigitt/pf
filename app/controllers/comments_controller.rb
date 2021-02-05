class CommentsController < ApplicationController
  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :user_id)
  end
end
