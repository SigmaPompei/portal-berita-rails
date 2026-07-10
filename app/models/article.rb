class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category, optional: true
  has_rich_text :body
  has_one_attached :cover_image

  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :body, presence: true
end 