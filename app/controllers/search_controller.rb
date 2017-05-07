class SearchController < ApplicationController
  def index
    search_words = params[:search][:search_word].split(/ +|　+/)
  end

  def suggest
  end
end
