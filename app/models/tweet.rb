class Tweet < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  has_one_attached :image
end
