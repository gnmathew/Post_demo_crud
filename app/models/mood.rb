class Mood < ApplicationRecord
  has_many :post_mood_ships
  has_many :moods, through: :post_mood_ships
end
