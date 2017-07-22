class ArticleImagesController < ApplicationController
  def new
    @article_image = ArticleImage.new
  end

  def create
    @aritcle_image = ArticleImage.create(article_image_params)

    redirect_to(new_article_image_path)
  end

  private
    def article_image_params
      params.require(:article_image).permit(:article_id, :image)
    end
end
