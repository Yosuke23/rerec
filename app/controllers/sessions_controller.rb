class SessionsController < ApplicationController

  def new
  end

  def create
   	@user = User.find_by(email: params[:session][:email].downcase) 
   if @user && @user.authenticate(params[:session][:password]) 
    log_in @user
    redirect_back_or @user
    flash[:success] = "#{@user.name}さんでログインしました"
   elsif params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
    redirect_back_or @user
    flash[:success] = "#{@user.name}さんでログインしました"
   else
   	flash.now[:danger] = 'メールアドレスが無効か、パスワードが不一致のようです'
   	render 'new'
   end
  end
  
  def destroy
   log_out if logged_in?
   redirect_to root_url
   flash[:info] = "ログアウトしました"
  end
end
