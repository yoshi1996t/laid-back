class Tweet < ApplicationRecord
  has_one_attached :image
  belongs_to :user

  geocoded_by :address
  after_validation :geocode
end
