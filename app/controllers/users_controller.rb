class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]
  skip_before_action :check_permission, only: %i[new create]

  def index
    @users = User.all

    respond_to do |format|
      format.json { render json: @users }
      format.html { render :index }
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    flash.notice, path = if @user.save
                           session[:user_id] = @user.id
                           ['Register User Successful', :root]
                         else
                           [@user.errors, :new_user]
                         end
    redirect_to path
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    flash.notice, path = if @user.update(user_params)
                           session[:user_id] = @user.id
                           ['Change Profiles Successful', :user]
                         else
                           [@user.errors, :edit_user]
                         end
    redirect_to path
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :email, :terms_of_service)
  end
end
