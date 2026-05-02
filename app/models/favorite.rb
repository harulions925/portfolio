class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :study_log
end
