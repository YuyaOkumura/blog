class LikesController < ApplicationController

  def create
    like = Like.new(like_params)
    if like.save
      result = like
    else
      result = nil
    end
    render json: result
  end

  private
    def like_params
      params.require(:like).permit(:article_id)
    end
end
