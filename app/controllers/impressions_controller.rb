class ImpressionsController < ApplicationController

 def create
   @impression = current_user.impressions.create(impression_params)
  if @impression.save
   redirect_to current_user
   flash[:success] = "投稿が完了しました"
  else
    redirect_to request.referrer || current_user
    flash[:danger] = "投稿内容に誤りがあります。タイトルとメモ欄は必ず入力してください"
  end
 end

 def impressions_title
  @user = User.find(current_user.id)
  @users = @user.impressions
  @impressions = Kaminari.paginate_array(@users).page(params[:page])
  @impression = current_user.impressions.build if logged_in?
  @book_title = Book.find(params[:book_id]).title
  @book_image = Book.find(params[:book_id]).image
 end

 private

  def impression_params
    params.require(:impression).permit(:content, :title, :image)
  end
end
