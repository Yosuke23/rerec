class User < ApplicationRecord
	attr_accessor :remember_token
 	before_save :downcase_email
    
    # アバター用アップローダー
    mount_uploader :avatar, AvatarUploader
	# nameのヴァリデーション
	validates :name, presence: true, length: { maximum: 39 }
	# emailのヴァリデーション
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
			  format: { with: VALID_EMAIL_REGEX },
	          uniqueness: { case_sensitive: false }
	# passwordのヴァリデーション
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	has_secure_password

## アソシエーション
     has_many :registers, dependent: :destroy
     has_many :second_registers, dependent: :destroy
     has_many :third_registers, dependent: :destroy
     has_many :impressions, dependent: :destroy
     
     has_many :reading_books, through: :registers, source: :book
     has_many :readed_books, through: :second_registers, source: :book
     has_many :want_books, through: :third_registers, source: :book

     has_many :authorizations, dependent: :destroy
## ログイン機能関連メソッド
    # 渡された文字列のハッシュ値を返す
    def self.digest(string)
     cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
     BCrypt::Password.create(string, cost: cost)
    end

    # ランダムなトークンを返す
    def self.new_token
     SecureRandom.urlsafe_base64
    end
    
    # 永続セッションのためにユーザーをデータベースに記憶する
    def remember
     self.remember_token = User.new_token
     update_attribute(:remember_digest, User.digest(remember_token))
    end

    # 渡されたトークンがダイジェストと一致したらtrueを返す
    def authenticated?(attribute, token)
     digest = send("#{attribute}_digest")
     return false if digest.nil?
     BCrypt::Password.new(digest).is_password?(token)
    end
    
    # ユーザーのログイン情報を破棄する
    def forget
     update_attribute(:remember_digest, nil)
    end

    # 読んでいる本に登録
    def reading_book_register(book)
     reading_books << book
    end

    # 読んでいる本から削除
    def reading_book_un_register(book)
     reading_books.destroy(book)
    end
    
    # 渡された本の情報が登録済みであればtrueを返す
    def reading_book_register?(book)
     reading_books.include?(book)
    end
    
    ## 読んだ本に登録
    def readed_book_register(book)
     readed_books << book
    end
    
    ## 読んだ本から削除
    def readed_book_un_register(book)
     readed_books.destroy(book)
    end

    ## 渡された本の情報が登録済みであればtrueを返す
    def readed_book_register?(book)
     readed_books.include?(book)
    end
    
    ### 読みたい本に登録
    def want_book_register(book)
     want_books << book
    end
    
    ### 読みたい本から削除
    def want_book_un_register(book)
     want_books.destroy(book)
    end
    
    ### 渡された本の情報が登録済みであればtrueを返す
    def want_book_register?(book)
     want_books.include?(book)
    end
    
    # OAuth関連メソッド authからユーザーをcreate
    def User.create_from_auth!(auth)
      token = User.new_token
      digest = User.digest(token)
     #if auth['info']['email'].nil?# twitterはnilなので、上段でtwitter取得。下段でfacebookのauth取得
      #User.create!(:name => auth['info']['name'], :email => ランダムのeダミーmialメソッド, :uid => auth['uid'], :provider => auth['provider'], :oauth_token => auth["credentials"], :password_digest => digest)
     #else
      User.create!(:name => auth['info']['name'], :email => auth['info']['email'], :uid => auth['uid'], :provider => auth['provider'], :oauth_token => auth["credentials"], :password_digest => digest)
     #end
    end

private
	 # メールアドレスを全て小文字に変換する
	  def downcase_email
	  	email.downcase!
	  end
end
