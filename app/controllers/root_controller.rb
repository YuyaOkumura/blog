class RootController < ApplicationController
  def root
    # is_public = true のレコードを整形していく
    articles = Article.includes(:tags).where(is_public: true)
    @articles = articles.order("created_at DESC").limit(3)
    # arrayにはlimitが使えないためindex番号を利用して要素数を擬似的に調整している
    @popular_articles = articles.order("created_at DESC").limit(3)
  end
end
