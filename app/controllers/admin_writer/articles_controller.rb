class AdminWriter::ArticlesController < AdminWriter::ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to [:admin_writer, @article], notice: '記事は正しく作成されました'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to [:admin_writer, @article], notice: '記事は正しく更新されました'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_writer_articles_url, notice: '記事は正しく削除されました'
  end

  # todo tags_controllerに移動
  def tag_check
    tag = Tag.where(name: tag_name_params[:tag_name])
    if tag.present?
      result = tag
    else
      result = false
    end
    render json: result
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title,
                                      :desc,
                                      :content,
                                      :is_public,
                                      :user_id,
                                      :main_image,
                                      article_tags_attributes: [
                                        :id,
                                        :article_id,
                                        :tag_id,
                                        :_destroy
                                      ]
      )
    end

    # todo tags_controllerに移動
    def tag_name_params
      params.require(:article).permit(:tag_name)
    end
end
