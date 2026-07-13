class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  validates :content, presence: true, length: { minimum: 3, maximum: 500 }
end