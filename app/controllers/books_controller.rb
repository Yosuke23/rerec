class BooksController < ApplicationController
   before_action :logged_in_user, only: [:create]
 
  def index
   @book = User.find(current_user.id)
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
    @book = User.find(current_user.id)
    @books = @book.reading_books.order(created_at: :desc)
  end

  def readed_books
   @book = User.find(current_user.id)
   @books = @book.readed_books.order(created_at: :desc)
  end

  def want_books
   @book = User.find(current_user.id)
   @books = @book.want_books.order(created_at: :desc)
  end

  def search
   @search_form = SearchBooksForm.new(search_books_params)
   books = GoogleBook.search(@search_form.keyword)
   @books = Kaminari.paginate_array(books).page(params[:page])
  end

private

	  def search_books_params
	   params.fetch(:q, keyword: '').permit(:keyword)
	  end

	  def create_book_params
	   params.permit(:googlebooksapi_id)
	  end
end