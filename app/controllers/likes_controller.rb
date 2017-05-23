class LikesController < ApplicationController

  def change_like
    like = Like.new(
      article_id: like_params[:article_id],
      user_token: current_user_token
    )
    if like.save
      result = Article.find_by(id: like_params[:article_id]).likes.count
      status = 'create'
    else
      like = Like.find_by(
        article_id: like_params[:article_id],
        user_token: current_user_token
      )
      like.destroy
      result = Article.find_by(id: like_params[:article_id]).likes.count
      status = 'destroy'
    end
    logger.info([result, status])
    render json: [result, status]
  end

  private
    def like_params
      params.require(:like).permit(:article_id)
    end
end
