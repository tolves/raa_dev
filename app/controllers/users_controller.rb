class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  before_action :permission_restrict, only: [:show, :update, :destroy]

  def index
    @user = User.first

    respond_to do |format|
      format.json { render json: @user }
      format.html { render :index }
    end
  end

  def show
    @user = User.find(session[:user_id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash.notice = 'Register User Successful'
      session[:user_id] = @user.id
      redirect_to :root
    else
      flash.notice = @user.errors
      redirect_to :new_user
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
      @user.password, @user.email = user_params[:password], user_params[:email]
    if @user.save
      flash.notice = 'Change Profiles Successful'
      redirect_to :user
    else
      flash.notice = @user.errors.messages
      render 'edit'
    end
  end

  def permission_restriction
  end


  private
  def user_params
    params.require(:user).permit(:name, :password, :email, :terms_of_service)
  end
  
  def permission_restrict
    redirect_to :permission_restriction if session[:user_id] != params[:id].to_i
  end
end
