class CommentsController < ApplicationController

  def new
    @comment = Comment.new()
    if params[:comment][":parent_id"]
      @parent_id = params[:comment][":parent_id"].to_i
    else
      @parent_id = nil
    end
  end

  def show
    @comment = Comment.find_by_id(params[:id])
  end


  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to post_url(@comment.post)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author_id, :post_id, :parent_id, :content)
  end

end
