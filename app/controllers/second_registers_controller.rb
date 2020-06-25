class SecondRegistersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
   @book = Book.find(params[:book_id])
   current_user.readed_book_register(@book)
   if @book[:page_count] == 0
    flash[:danger]= "『#{@book[:title]}』はページ数の登録が無い為、読んだページに加算されません"
   else
    flash[:info] = "読了した『#{@book[:title]}』のページ数（#{@book[:page_count]}P）を読んだページの合計に加算しました"
   end
    redirect_to readed_books_path
  end

  def destroy
   @book = current_user.second_registers.find(params[:id]).book
   current_user.readed_book_un_register(@book)
   #redirect_to @book
   redirect_to readed_books_path
  end
end
