class ArticlesController < ApplicationController
  def index
    # is_public = true のレコードを整形していく
    articles = Article.where(is_public: true)
    if params[:favorite].blank? && params[:month].blank?
      @articles = articles.order("created_at DESC").page(params[:page])
    # 人気順かつ月指定あり
    elsif params[:favorite] == 'true' && params[:month].present? && params[:month].to_i < 13
      @articles = articles.sort_by { |article| -(article.favorites.count) }
    # 人気順
    elsif params[:favorite] == 'true'
      @articles = articles.sort_by { |article| -(article.favorites.count) }
    # 月ごとの投稿
    elsif params[:month].present? && params[:month].to_i < 13
      # どっかにライブラリ作って key = 月, value = DateTime.all_month のやつを作りそれを参照して呼ぼう
      @articles = articles.where(created_at: DateTime.now.all_month)
                          .order("created_at DESC")
                          .page(params[:page])
    else
      # エラー回避用
      @articles = []
    end
  end

  def show
    @article = Article.find(params[:id])
  end
end
