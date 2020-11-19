class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :likes, dependent: :destroy

  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
end
