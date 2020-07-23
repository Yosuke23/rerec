class ThirdRegistersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
   @book = Book.find(params[:book_id])
   current_user.want_book_register(@book)
   flash[:info] = "『#{@book[:title]}』を読みたい本に登録しました"
   redirect_to want_books_path
  end

  def destroy
   @book = current_user.third_registers.find(params[:id]).book
   current_user.want_book_un_register(@book)
   flash[:info] = "『#{@book[:title]}』を読みたい本から除外しました"
   redirect_to want_books_path
  end
end
