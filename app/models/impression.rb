class Impression < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  scope :search_by_keyword, -> (keyword) {
    where("impressions.title LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%")
    .or(where("impressions.content LIKE :keyword", keyword: "%#{sanitize_sql_like(keyword)}%")) if keyword.present?
   }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: { maximum: 2000 }
end
