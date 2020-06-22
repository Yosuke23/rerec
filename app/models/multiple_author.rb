class MultipleAuthor < ApplicationRecord
 belongs_to :book
 validates :name, presence: true, length: { maximum: 255 }
end
