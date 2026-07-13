class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles
  enum :role, { user: 0, admin: 1 }

  validates :username,
    uniqueness: { case_sensitive: false },
    length: { minimum: 3 },
    allow_blank: true

  def admin?
    role == "admin"
  end

  def display_name
    username.present? ? username : email.split("@").first
  end
  has_many :comments, dependent: :destroy
end
