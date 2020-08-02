class ImpressionsController < ApplicationController
 before_action :logged_in_user, only: [:create, :edit, :update, :destroy] 
 before_action :correct_user,   only: [:destroy, :edit, :update]
 
 def create
   @impression = current_user.impressions.build(impression_params)
  if @impression.save
   redirect_to impressions_page_url
   flash[:success] = "投稿が完了しました"
  else
   redirect_to request.referrer || current_user
   flash[:danger] = "投稿内容に誤りがあります。タイトルとメモ欄は必ず入力してください"
  end
 end

 def edit
  @impression = Impression.find(params[:id])
 end

 def update
  @impression = Impression.find(params[:id])
  if @impression.update(impression_params)
    flash[:success] = "編集内容に更新しました"
    redirect_to current_user
  else
   render 'edit_impression'
  end
 end

 def destroy
  @impression = current_user.impressions.find(params[:id])
  @impression.destroy
  flash[:success] = "投稿を削除しました"
  redirect_to request.referrer || current_user
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
  
  def correct_user
   @impression = current_user.impressions.find_by(id: params[:id])
   redirect_to root_url if @impression.nil?
  end
end
