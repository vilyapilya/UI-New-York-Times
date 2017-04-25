class SubsController < ApplicationController

  before_action :require_login

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    @sub.moderator = current_user
    if @sub.save
      render :index
    else
      flash[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def update
    @sub = current_user.subs
    @sub = @sub.find(params[:id])
    if @sub.update(sub_params)
      render :show
    else
      flash[:errors] = @sub.errors.full_messages
      render :show
    end
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
