class ArticlesController < ApplicationController
  before_action :set_breadcrumb

  include ArchiveHelper

  def index
    # is_public = true のレコードを整形していく
    articles = Article.where(is_public: true)
    if params[:like].blank? && params[:year_month].blank?
      @articles = articles.order("created_at DESC").page(params[:page])
      @notice = '記事一覧 : 新着順'
    # 人気順かつ月指定あり
    elsif params[:like] == 'true' && params[:year_month].present?
      # Kaminari.paginate_array : arrayに対してkaminariのページネーションをするためにarrayを加工
      @articles = Kaminari.paginate_array(
        articles.sort_by { |article| -(article.likes.count) }
      ).page(params[:page])
      @notice = "記事一覧 : #{year_month_conversion(params[:year_month])}の記事 : 人気順"
    # 人気順
    elsif params[:like] == 'true'
      # Kaminari.paginate_array : arrayに対してkaminariのページネーションをするためにarrayを加工
      @articles = Kaminari.paginate_array(
        articles.sort_by { |article| -(article.likes.count) }
      ).page(params[:page])
      @notice = "記事一覧 : 人気順"
    # 月ごとの投稿
    elsif params[:year_month].present?
      @articles = articles.where(created_at: get_current_month(params[:year_month]))
                          .order("created_at DESC")
                          .page(params[:page])
      @notice = "記事一覧 : #{year_month_conversion(params[:year_month])} : 新着順"
    else
      # エラー回避用
      @articles = Kaminari.paginate_array([]).page(params[:page])
      @notice = "エラーがあります。正しく描画されませんでした。"
    end
    if params[:page].present?
      add_breadcrumb "#{params[:page]}ページ目", articles_path(page: params[:page])
    end

    set_meta_tags(
      title: @notice,
      description: "#{@notice}　のページです。条件ごとの記事が閲覧できます。"
    )
  end

  def show
    @article = Article.find(params[:id])
    add_breadcrumb @article.title, article_path(@article)

    set_meta_tags(
      title: @article.title,
      description: @article.content.truncate(100)
    )
  end

  private
    def set_breadcrumb
      add_breadcrumb '記事一覧', articles_path
    end
end
