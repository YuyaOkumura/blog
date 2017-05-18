class SearchController < ApplicationController

  before_action :set_breadcrumb

  def index
    search_words = get_search_words
    @searched_articles, @searched_tags = get_searched_articles(search_words)
  end

  def suggest
    search_words = get_search_words
    searched_articles, searched_tags = get_searched_articles(search_words)
    @suggest_articles = searched_articles.pluck(:title)
    @suggest_tags = searched_tags.pluck(:name)
  end

  private
    def set_breadcrumb
      add_breadcrumb '記事検索', search_path
    end

    def get_search_words
      if params[:search].present?
        @search_word = params[:search][:search_word]
        search_words = @search_word.split(/ +|　+/)
      end
      return search_words
    end

    def get_searched_articles(words)
      searched_articles = []
      searched_tags = []
      words.each_with_index do |word, i|
        articles = Article.where(Article.arel_table[:title].matches("%#{word}%"))
        tags = Tag.where(Tag.arel_table[:name].matches("%#{word}%"))
        # 重複があればここでカット
        if i == 0
          searched_articles = articles
          searched_tags = tags
        else
          searched_articles = articles & searched_articles
          searched_tags = tags & searched_tags
        end
      end
      return searched_articles, searched_tags
    end
end
