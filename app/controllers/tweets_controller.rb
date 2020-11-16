class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def show
  end

  # def map
  #   # respond_to以下の記述によって、
  #   # remote: trueのアクセスに対して、
  #   # map.js.erbが変えるようになります。
  #   respond_to do |format|
  #     format.js
  #   end
  # end

  private
  def tweet_params
    params.require(:tweet).permit(:name, :text, :image, :address, :latitude, :longitude).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
