class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = UserDecorator.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user }
      else
        format.html { render action: "new" }
      end
    end
  end
end
