class Beer < ApplicationRecord
  validates :name, presence: true
  validates :style, presence: true

  include Enumerable
  include RatingAverage
  belongs_to :brewery
  has_many :ratings, dependent: :destroy
  has_many :raters, -> { distinct }, through: :ratings, source: :user

  def to_s
    "#{name}, #{brewery.name}"
  end
end
