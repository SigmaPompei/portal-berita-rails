class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles

  enum :role, { user: 0, admin: 1 }

  def admin?
    role == "admin"
  end
end