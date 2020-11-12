class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def index
    @user = User.first
    puts @user.inspect
  end

  def show
    @user = User.find(params[:id])

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password, @user.salts = helpers.hash_password @user.password
    if @user.save
      session[:user_id] = @user.id
      redirect_to :root
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
   
    redirect_to articles_path
  end


  private
  def user_params
      params.require(:user).permit(:name, :password)
  end
end
