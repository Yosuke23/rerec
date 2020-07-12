class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :destroy]
  before_action :only_user, only: [:show]

  def new
   @user = User.new
  end

  def show
   date = Date.today
   @user = User.find(current_user.id)
   @books = @user.reading_books.order(created_at: :desc)
   @page_count = @user.readed_books.pluck(:page_count).sum
   @book_count = @user.readed_books.count
   @now_month_count = @user.readed_books.where(created_at: date.beginning_of_month..date.end_of_month).count
   @month_page_count = @user.readed_books.where(created_at: date.beginning_of_month..date.end_of_month).pluck(:page_count).sum
   @month_book_count = SecondRegister.where(user_id: current_user.id).group("MONTH(created_at)").count
   @year_book_count = SecondRegister.where(user_id: current_user.id).group("YEAR(created_at)").count
   @users = @user.impressions
   @impressions = Kaminari.paginate_array(@users).page(params[:page])
   @impression = current_user.impressions.build if logged_in?
  end

  def create
   @user = User.new(user_params)
    if @user.save
   	 flash[:success] = "登録が完了しました"
   	 redirect_to @user
     log_in @user
    else
   	 render 'new'
    end
  end

private

	  def user_params
	   params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
	  end
     # アクセスしてきたユーザーとログイン中のユーザー（current_user）が同一でなければroot_urlに転送させ論理値を返す
    def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
    end

    # ログインしていないユーザーのshowにアクセスするとログイン中の自分のshowページにリダイレクトされる
    def only_user
     @user = User.find(params[:id])
     redirect_to current_user unless current_user?(@user)
    end

end