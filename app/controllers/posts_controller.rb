class PostsController < ApplicationController

  def new
    @post = Post.new
    render :new
  end

  def create
    fail
    @post = Post.new(post_params)
    if @post.save
      @post.sub_ids = post_params[:sub_ids]
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def destroy
    @post = Post.find_by_id(params[:id])
    @post.delete
    redirect_to posts_url
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    if @post.update!(post_params.reject {|k,v| k == "sub_ids" })
      @post.sub_ids = post_params[:sub_ids].map(&:to_i)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @posts.errors.full_messages
      render :edit
    end
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:url, :title, :content, :author_id, :sub_ids => [])
  end


end
