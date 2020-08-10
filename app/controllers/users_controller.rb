class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show, :destroy, :impressions_page, :all_impressions_page, :readed_books_table]
  before_action :only_user, only: [:show]
  before_action :admin_user, only: [:index, :destroy]

  def index
   @user = User.all
   @users = Kaminari.paginate_array(@user).page(params[:page])
  end

  def new
   @user = User.new
  end

  def show
   date = Date.today
   now = Time.current
   @user = User.find(params[:id])
   @books = @user.reading_books.order(updated_at: :desc)
   @book_paginate = Kaminari.paginate_array(@books).page(params[:page]).per(1)
   @page_count = @user.readed_books.pluck(:page_count).sum
   @book_count = @user.readed_books.count
   @now_month_count = @user.readed_books.where(created_at: date.beginning_of_month..date.end_of_month).count
   @last_month_count = @user.readed_books.where(created_at: now.prev_month..now.prev_month.end_of_month).count
   @month_page_count = @user.readed_books.where(created_at: date.beginning_of_month..date.end_of_month).pluck(:page_count).sum
   @last_month_page_count = @user.readed_books.where(created_at: now.prev_month..now.prev_month.end_of_month).pluck(:page_count).sum
   @month_book_count = SecondRegister.where(user_id: current_user.id).group("MONTH(created_at)").count
   @year_book_count = SecondRegister.where(user_id: current_user.id).group("YEAR(created_at)").count
   @users = @user.impressions
   @impressions = Kaminari.paginate_array(@users).page(params[:page])
   @impression = current_user.impressions.build if logged_in?
   # サイト内検索機能
   unless params[:i] == "" # 空文字対策
    if params[:i]
     @feed_item = Impression.all.search_by_keyword(params[:i])
      if @feed_item.any?
       @feed_items = Kaminari.paginate_array(@feed_item).page(params[:page]).per(5)
       flash.now[:success]= "#{@feed_item.count}件の投稿がヒットしました"
      else
       flash[:danger] = "“#{params[:i]}” に一致する項目が見当たりませんでした"
       redirect_to impressions_page_path
     end
    end
   end
  end
  
  def create
   @user = User.new(user_params)
    if @user.save
   	 flash[:success] = "登録が完了しました"
   	 redirect_to @user
     log_in @user
    else
     flash.now[:danger] = '名前、メールアドレスが無効か、パスワードが不一致のようです'
   	 render 'new'
    end
  end
  
  def destroy
   User.find(params[:id]).destroy
   flash[:success] = "削除しました"
   redirect_to users_url
  end
  
  def impressions_page
   @user = User.find_by(id: current_user.id)
   @users = @user.impressions.order(updated_at: :desc)
   @impressions = Kaminari.paginate_array(@users).page(params[:page]).per(5)
   @impression = current_user.impressions.build if logged_in?
  end

  def all_impressions_page
   @all_impression = Impression.where(published: true).order(updated_at: :desc)
   @all_impressions = Kaminari.paginate_array(@all_impression).page(params[:page]).per(5)
   flash.now[:info] = "投稿内容にはネタバレが含まれる場合があります"
  end

  def readed_books_table
    @user = User.find(current_user.id) 
    @books_table = @user.readed_books.order(created_at: :desc).pluck(:title, :author, :created_at)
    @books_table_data = Kaminari.paginate_array(@books_table).page(params[:page]).per(10)
    @table_num = Kaminari.paginate_array(@books_table).page(params[:page]).current_page
    @base_level = (@table_num - 1)*10
  end
   
private

	  def user_params
	   params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :avatar)
	  end
     # アクセスしてきたユーザーとログイン中のユーザー（current_user）が同一でなければroot_urlに転送させ論理値を返す
    def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
    end

    # adminを除く通常のユーザーがログインしていない他のユーザーのshowにアクセスすると自分のshowにリダイレクト
    def only_user
     unless current_user.admin?
      @user = User.find(params[:id])
      redirect_to current_user unless current_user?(@user)
     end
    end

    # adminユーザーでないユーザーがアクセスしたらrootにリダイレクト
    def admin_user
     redirect_to(root_url) unless current_user.admin?
    end
end