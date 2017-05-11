class TagsController < ApplicationController

  before_action :set_breadcrumb

  def index
    # タグの数は肥大化したらページネーション化する
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by(slug: params[:slug])
    @aritcles = @tag.articles.page(params[:page])
    add_breadcrumb "#{@tag.name}", tag_path(@tag.slug)
  end

  private
    def set_breadcrumb
      add_breadcrumb 'タグ一覧', tags_path
    end
end
