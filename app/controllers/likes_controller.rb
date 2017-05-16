class LikesController < ApplicationController

  def change_like
    like = Like.new(like_params)
    like.update(user_token: current_user_token)
    if like.save
      result = Article.find_by(params[:article_id]).likes.count
      status = 'create'
    else
      like = Like.find_by(like_params, user_token: current_user_token)
      like.destroy
      result = Article.find_by(params[:article_id]).likes.count
      status = 'destroy'
    end
    render json: [result, status]
  end

  private
    def like_params
      params.require(:like).permit(:article_id)
    end
end
