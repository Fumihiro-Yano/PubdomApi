class Admin::SessionsController < Admin::Base
  # before_action :check_api_key  


  #=
  #emailとpasswordをもとにログイン認証を行う関数
  #
  #成功: return array(user_info)
  #失敗: return bool(false)
  #
  #URL: /admin/login_user_info?email=******&password=*****
  #=

  def login_user_info
    #引数チェック
    if !check_argument(params[:email], params[:password])
      render json: false, status:404
      return
    end

  	@user = User.find_by(email: params[:email].downcase)
  	if ! @user
      render json: false, status:404
  	  return
  	end
  	@authenticate = @user.authenticate(params[:password])
  	#authenticateは認証に成功したら、user情報を返す。失敗したらfalseを返す
    if ! @authenticate
      render json: @authenticate, status:404
      return
    end
  	render json: @authenticate
  end

  #=
  #永続的セッションで使用するトークンを発行する関数
  #
  #成功: return string(remember_token)
  #失敗: return bool(false)
  #
  #URL: /admin/remember?id=**
  #=

  def remember
    #引数チェック
    if !check_argument(params[:id])
      render json: false, status:404
      return
    end

    @user = User.find_by(id: params[:id])
    if ! @user
      render json: false, status:404
      return
    end
    @result = @user.remember
    if ! @result
      render json: false, status:404
      return
    end
    render json: @result
  end

  #=
  #永続的セッションで保存したトークンの認証を行う関数
  #
  #成功: return bool(true)
  #失敗: return bool(false)
  #
  #URL: /admin/authenticated_token?id=**&remember_token=*****
  #=

  def authenticated_token
    #引数チェック
    if !check_argument(params[:id], params[:remember_token])
      render json: false, status:404
      return
    end

    @user = User.find_by(id: params[:id])

    if ! @user
      render json: false, status:404
      return
    end

    @result = @user.authenticated?(params[:remember_token])
    render json: @result
  end

  #=
  #永続的セッションで保存したトークンの破棄を行う関数
  #
  #成功: return bool(true)
  #失敗: return bool(false)
  #
  #URL: /admin/forget_remember?id=**
  #=

  def forget
    #引数チェック
    if !check_argument(params[:id])
      render json: false, status:404
      return
    end

    @user = User.find_by(id: params[:id])
    if ! @user
      render json: false, status:404
      return
    end
    render json: @user.forget
  end

end
