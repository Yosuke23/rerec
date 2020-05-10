class User < ApplicationRecord
 before_save :downcase_email

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


private
	 # メールアドレスを全て小文字に変換する
	  def downcase_email
	  	email.downcase!
	  end
end
