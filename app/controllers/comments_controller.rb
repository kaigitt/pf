class CommentsController < ApplicationController
  def show
  end

  def create
    @play_list = PlayList.find(params[:play_list_id])
    @comment = Comment.new(comment_params)
    @comment.play_list_id =@play_list.id
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to play_list_path(@play_list)
    else
      render :show
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
