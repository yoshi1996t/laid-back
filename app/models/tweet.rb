class Tweet < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  has_one_attached :image

  # 空の状態では保存できないようにする
  validates :image, :name, :text, :genre,  presence: true

   # ジャンルの選択が「---」の時は保存できないようにする
   validates :genre_id, numericality: { other_than: 1 }

   with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :genre
   end
end
