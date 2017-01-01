class Admin::UsersController < Admin::Base
  #before_action :check_api_key  
  
  def index
  	@users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  	render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
