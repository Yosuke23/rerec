class BooksController < ApplicationController
   before_action :logged_in_user, only: [:create]
 
  def index
   @user = User.find(current_user.id)
   @books = Book.all
  end
  
  def create         #GoogleBook.new => google_book.rb
    google_book = GoogleBook.new_from_id(create_book_params[:googlebooksapi_id])
   if (@book = google_book.find_book_or_save)
    redirect_to @book
   else
    redirect_to search_books_path
    flash[:danger] = "ページの表示に失敗しました"
   end
  end

  def show
   @book = Book.find(params[:id])
   @books = Book.all
  end

  def reading_books
    @user = User.find(current_user.id)
    @books = @user.reading_books.order(updated_at: :desc)
    @book_paginate = Kaminari.paginate_array(@books).page(params[:page]).per(5)
    @users = @user.impressions
    @impressions = Kaminari.paginate_array(@users).page(params[:page]).per(5)
    @impression = current_user.impressions.build if logged_in?
  end

  def readed_books
   date = Date.today
   now = Time.current
   @user = User.find(current_user.id)
   @books = @user.readed_books.order(created_at: :desc)
   @book_paginate = Kaminari.paginate_array(@books).page(params[:page]).per(5)
   @books_created_at = @user.readed_books.pluck(:created_at)
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

  def want_books
   @user = User.find(current_user.id)
   @books = @user.want_books.order(updated_at: :desc)
   @book_paginate = Kaminari.paginate_array(@books).page(params[:page]).per(5)
  end
  
  def search
   @search_form = SearchBooksForm.new(search_books_params)
   books = GoogleBook.search(@search_form.keyword)
   @books = Kaminari.paginate_array(books).page(params[:page]).per(5)
  end

private

	  def search_books_params
	   params.fetch(:q, keyword: '').permit(:keyword)
	  end

	  def create_book_params
	   params.permit(:googlebooksapi_id)
	  end
end