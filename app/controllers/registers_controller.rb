class RegistersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def create
   @book = Book.find(params[:book_id])
   @reading_book = current_user.reading_book_register(@book)
   @book.update(updated_at: Time.current)
   current_user.want_book_un_register(@book) if current_user.want_book_register?(@book)
   flash[:info] = "『#{@book[:title]}』を読んでいる本に登録しました"
   redirect_to reading_books_path
  end

  def destroy
   @book = current_user.registers.find(params[:id]).book
   current_user.reading_book_un_register(@book)
   flash[:info] = "『#{@book[:title]}』を読んでいる本から除外しました"
   redirect_to reading_books_path
  end
end