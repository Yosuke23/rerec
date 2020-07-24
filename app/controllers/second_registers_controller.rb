class SecondRegistersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  
  def create
   @book = Book.find(params[:book_id])
   @readed_book = current_user.readed_book_register(@book)
   @book.update(updated_at: Time.current)
   if @book[:page_count] == 0
    flash[:danger] = "『#{@book[:title]}』はページ数の登録が無い為、読んだページに加算されません"
   else
    flash[:info] = "『#{@book[:title]}』を読んだ本に登録しました。ページ数（#{@book[:page_count]}P）が読んだページの合計に加算されました"
   end
    current_user.reading_book_un_register(@book) if current_user.reading_book_register?(@book)
    redirect_to readed_books_path
  end

  def destroy
   @book = current_user.second_registers.find(params[:id]).book
   current_user.readed_book_un_register(@book)
   flash[:info] = "『#{@book[:title]}』を読んだ本から除外しました"
   redirect_to readed_books_path
  end
end
