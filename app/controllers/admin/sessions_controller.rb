class Admin::SessionsController < Admin::Base
  # before_action :check_api_key  
  
  def get_login_user
  	@user = User.find_by(email: params[:email].downcase)
  end
end
