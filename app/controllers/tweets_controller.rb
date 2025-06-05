class TweetsController < ApplicationController
  def index
    user = User.find_by!(username: params[:user_username])
    tweets = user.tweets
    limit = params[:limit].presence || 10
    cursor = params[:cursor]

    tweets = tweets.order(created_at: :desc)
    tweets = tweets.where("created_at <= ?", Time.at(cursor.to_f)) if cursor.present?
    tweets = tweets.limit(limit)

    render json: {
      tweets: tweets.as_json(only: [:id, :user_id, :text, :created_at]),
      next_cursor: tweets.last&.created_at.to_f
    }
  end
end
