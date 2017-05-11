class ArticlesController < ApplicationController
  before_action :set_breadcrumb

  def index
    # is_public = true のレコードを整形していく
    articles = Article.where(is_public: true)
    if params[:like].blank? && params[:date].blank?
      @articles = articles.order("created_at DESC").page(params[:page])
      @notice = '記事一覧 : 更新順'
    # 人気順かつ月指定あり
    elsif params[:like] == 'true' && params[:date].present?
      # Kaminari.paginate_array : arrayに対してkaminariのページネーションをするためにarrayを加工
      @articles = Kaminari.paginate_array(
        articles.sort_by { |article| -(article.likes.count) }
      ).page(params[:page])
    # 人気順
    elsif params[:like] == 'true'
      # Kaminari.paginate_array : arrayに対してkaminariのページネーションをするためにarrayを加工
      @articles = Kaminari.paginate_array(
        articles.sort_by { |article| -(article.likes.count) }
      ).page(params[:page])
      @notice = "記事一覧 : 人気順"
    # 月ごとの投稿
    elsif params[:date].present?
      # どっかにライブラリ作って key = 月, value = DateTime.all_month のやつを作りそれを参照して呼ぼう
      @articles = articles.where(created_at: DateTime.now.all_month)
                          .order("created_at DESC")
                          .page(params[:page])
    else
      # エラー回避用
      @articles = []
      @notice = "エラーがあります。正しく描画されませんでした。"
    end
  end

  def show
    @article = Article.find(params[:id])
    add_breadcrumb @article.title, article_path(@article)
  end

  private
    def set_breadcrumb
      add_breadcrumb '記事一覧', articles_path
    end
end
