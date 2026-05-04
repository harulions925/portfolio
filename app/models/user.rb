class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :study_logs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_items, through: :favorites, source: :study_log

  validates :name, presence: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      user.name = "ゲストユーザー"
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
