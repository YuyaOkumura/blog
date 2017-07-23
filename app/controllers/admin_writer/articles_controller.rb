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
      redirect_to [:admin_writer, @article], notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to [:admin_writer, @article], notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_writer_articles_url, notice: 'Article was successfully destroyed.'
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

  # todo markdownに名称変更
  # todo markdown_images_controllerに移動
  def markdown_image_upload
    article_image = MarkdownImage.new(image: article_image_params[:markdown_image])
    if article_image.save
      result = article_image
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

    # todo markdown_images_controllerに移動
    def markdown_image_params
      params.require(:article).permit(:markdown_image)
    end
end
