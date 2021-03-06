class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', {content: @comment, user: @comment.user, time: @comment.created_at.strftime("%m/%d %H:%M")}
    else
      @item = @comment.item
      @comments = @item.comments
      render 'items/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end