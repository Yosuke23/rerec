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
     has_many :books, through: :registers
     
## ログイン機能関連メソッド

    # 渡された文字列のハッシュ値を返す
	def self.digest(string)
	 cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt.Engine.cost
	 BCrypt::Password.create(string, cost: cost)
    end

    # ランダムなトークンを返す
    def self.new_token
     SecureRandom.urlsafe_base64
    end
    
    # 永続セッションのためにユーザーをデータベースに記憶する
    def remember
     self.remember_token = User.new_token
     user.update_attribute(:remember_digest, User.digest(remember_token))
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

private
	 # メールアドレスを全て小文字に変換する
	  def downcase_email
	  	email.downcase!
	  end
end
