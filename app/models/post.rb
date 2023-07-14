class Post < ApplicationRecord
  default_scope { where(deleted_at: nil) }

  validates :title, presence: true
  validates :content, presence: true

  scope :recent, -> { order(created_at: :desc) }
  scope :today, -> { where('created_at >= ?', Time.current.beginning_of_day) }
  scope :filter_by_region, -> (region_name) { where(region: {name: region_name } )}

  delegate :email, to: :user

  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
  has_many :post_mood_ships
  has_many :moods, through: :post_mood_ships

  belongs_to :genre
  belongs_to :user

  def destroy
    update(deleted_at: Time.now)
  end
end
