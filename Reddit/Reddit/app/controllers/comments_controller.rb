class CommentsController < ApplicationController

  def create

    @comment = Comment.new(c_params)
    @comment.user_id = current_user.id
    if @comment.save!
      redirect_to post_url(@comment.post)
    else
      flash[:errors] = ["bad comment"]
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def c_params
    params.require(:comment).permit(:content, :post_id, :parent_id)
  end

end
