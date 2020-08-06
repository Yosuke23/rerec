class SessionsController < ApplicationController

  def new
  end

  def create
   auth = request.env["omniauth.auth"] # SNSログイン機能
   if auth.present?
    unless @auth = Authorization.find_from_auth(auth)
           @auth = Authorization.create_from_auth(auth)
    end
    @user = @auth.user
    session[:user_id] = @user.id
    redirect_back_or @user  
   else # 以下通常のログイン機能
   	 @user = User.find_by(email: params[:session][:email].downcase) 
    if @user && @user.authenticate(params[:session][:password]) 
     log_in @user
     flash[:success] = "#{@user.name}さんでログインしました"
     params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
     redirect_back_or @user
    else
   	 flash.now[:danger] = 'メールアドレスが無効か、パスワードが不一致のようです'
   	 render 'new'
    end
   end
  end
  
  def destroy
   log_out if logged_in?
   redirect_to root_url
   flash[:info] = "ログアウトしました"
  end
end
