module SessionsHelper

 # 渡されたユーザーでログインする
 def log_in(user)
  session[:user_id] = user.id
 end

# ユーザーのセッションを永続的にする
 def remember(user)
  user.remember
  cookies.permanent.signed[:user_id] = user.id
  cookies.permanent[:remember_token] = user.remember_token
 end

 # 記憶トークンcookieに対応するユーザーを返す
 def current_user
  auth = request.env["omniauth.auth"] # SNSログイン機能
  if auth.present?
   unless @auth = Authorization.find_from_auth(auth)
          @auth = Authorization.create_from_auth(auth)
   end
   @user = @auth.user
   session[:user_id] = @user.id
   redirect_back_or @user
  else # 以下通常のログイン機能
    if(user_id = session[:user_id])
     @current_user ||= User.find_by(id: user_id)
    elsif(user_id = cookies.signed[:user_id])
     user = User.find_by(id: user_id)
     if user && user.authenticated?(:remember, cookies[:remember_token])#この:rememberはauthenticated?メソッド内のsend("#{attribute}_digest")のattributeに当てる
      log_in user
      @current_user = user
     end
    end
  end
 end

 # ユーザーがログインしていればtrue、その他ならfalseを返す
 def logged_in?
  !current_user.nil?
 end

 # 渡されたユーザーがログイン済みユーザーであればtrueを返す
 def current_user?(user)
  user == current_user
 end

 # 永続的セッションを破棄する
 def forget(user)
  user.forget
  cookies.delete(:user_id)
  cookies.delete(:remember_token)
 end

 # 渡されたユーザーをログアウトする
 def log_out
  forget(current_user)
  session.delete(:user_id)
  @current_user = nil
 end
 
 # 記憶したURL (もしくはデフォルト値) にリダイレクト
 def redirect_back_or(default)
  redirect_to(session[:forwarding_url] || default)
  session.delete(:forwarding_url)#リダイレクトしたらそれ限り記憶を消す
 end

 # アクセスしようとしたURLを覚えておく
 def store_location
  session[:forwarding_url] = request.original_url if request.get?
 end
end