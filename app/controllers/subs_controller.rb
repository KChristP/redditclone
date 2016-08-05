class SubsController < ApplicationController
  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(sub_params)
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find_by_id(params[:id].to_i)
    render :show
  end

  def edit
    @sub = Sub.find_by_id(params[:id].to_i)
    render :edit
  end

  def update
    @sub = Sub.find_by_id(params[:id].to_i)
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find_by_id(params[:id])
    if @sub.delete
      redirect_to subs_url
    else
      render :show
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :mod_id)
  end
end
