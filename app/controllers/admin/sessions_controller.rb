class Admin::SessionsController < Admin::Base
  # before_action :check_api_key  
  
  def login_user_info
  	@user = User.find_by(email: params[:email].downcase)
  	if ! @user
      render json: false
  	  return
  	end
  	@authenticate = @user.authenticate(params[:password])
  	#authenticateは認証に成功したら、user情報を返す。失敗したらfalseを返す
  	render json: @authenticate
  end
end
