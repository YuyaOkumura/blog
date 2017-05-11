class SearchController < ApplicationController

  before_action :set_breadcrumb

  def index
    if params[:search].present?
      @search_word = params[:search][:search_word]
      search_words = @search_word.split(/ +|　+/)
    end
  end

  def suggest
  end

  private
    def set_breadcrumb
      add_breadcrumb '記事検索', search_path
    end
end
