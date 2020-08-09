class ImpressionsController < ApplicationController
 before_action :logged_in_user, only: [:create, :edit, :update, :destroy] 
 before_action :correct_user,   only: [:destroy, :edit]
 
 def create
  @impression = current_user.impressions.build(impression_params)
  if params[:impression][:published] == '0' && @impression.title.length > 0 && @impression.content.length > 0
   @impression.save # 保存してから
   @impression.update(published: true) # trueへ変更して公開設定に
   redirect_to impressions_page_url
   flash[:success] = "投稿が完了しました。このメモは“みんなの読書メモ”にも公開されます"
  elsif params[:impression][:published] == '1' && @impression.title.length > 0 && @impression.content.length > 0
   @impression.save
   @impression.update(published: false) # falseへ変更して非公開に
   redirect_to impressions_page_url
   flash[:info] = "投稿が完了しました。このメモは非公開です"
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
  if params[:impression][:published] == '0' && @impression.title.length > 0 && @impression.content.length > 0
   @impression.update(impression_params)
   @impression.update(published: true) # trueへ変更して公開設定に
   redirect_to impressions_page_url
   flash[:success] = "編集内容を保存しました。このメモは“みんなの読書メモ”にも公開されます"
  elsif params[:impression][:published] == '1' && @impression.title.length > 0 && @impression.content.length > 0
   @impression.update(impression_params)
   @impression.update(published: false) # falseへ変更して公開設定に
   redirect_to impressions_page_url
   flash[:info] = "編集内容を保存しました。非公開メモに更新しました"
  else
   redirect_to request.referrer || current_user
   flash[:danger] = "編集内容に誤りがあります。タイトルとメモ欄は必ず入力してください"
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
   params.require(:impression).permit(:content, :title, :image, :published)
  end
  
  def correct_user
   @impression = current_user.impressions.find_by(id: params[:id])
   redirect_to root_url if @impression.nil?
  end
end
