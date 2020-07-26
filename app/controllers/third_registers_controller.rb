class ThirdRegistersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
   @book = Book.find(params[:book_id])
   @want_book = current_user.want_book_register(@book)
   @book.update(updated_at: Time.current)
   flash[:info] = "『#{@book[:title]}』を読みたい本に登録しました"
   if current_user.reading_book_register?(@book)
    current_user.reading_book_un_register(@book)
    flash[:info] = "『#{@book[:title]}』を読んでいる本から読みたい本に移動しました"
   end
   redirect_to want_books_path
  end

  def destroy
   @book = current_user.third_registers.find(params[:id]).book
   current_user.want_book_un_register(@book)
   flash[:info] = "『#{@book[:title]}』を読みたい本から除外しました"
   redirect_to want_books_path
  end
end
