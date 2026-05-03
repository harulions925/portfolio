class StudyLog < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :favorites, dependent: :destroy

    validates :title, presence: true
    validates :title, length: { maximum: 50 }
    validates :content, presence: true
    validates :study_time, presence: true,
                           numericality: { only_integer: true, greater_than: 0 }
    validates :study_date, presence: true
    validates :category_id, presence: true

    def favorited_by?(user)
        favorites.exists?(user_id: user.id)
    end
end
