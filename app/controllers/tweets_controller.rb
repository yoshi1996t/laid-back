class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show, :destroy, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @tweets = Tweet.order('id DESC')
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @tweet.destroy
    redirect_to root_path
    else
    render :show
    end
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render
    end
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
    params.require(:tweet).permit(:name, :text, :image, :address, :latitude, :longitude, :genre_id).merge(user_id: current_user.id)
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
