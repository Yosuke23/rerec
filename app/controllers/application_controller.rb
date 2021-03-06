class ApplicationController < ActionController::Base
 protect_from_forgery with: :exception
 include SessionsHelper

private

# ユーザーが非ログインだった場合URLをセッションにユーザーがアクセスしたURLを記憶しログインを促し、
# ログインしたら、記憶したURLにリダイレクトさせる
	def logged_in_user
	 unless logged_in?
	 flash[:danger] = "ログインしてください"
	 redirect_to started_page_url
     end
	end

	def un_logged_in_user
	 if logged_in?
		flash[:danger] = "既にログイン済みです"
		redirect_to current_user
	 end
	end
end
