class TagsController < ApplicationController

  before_action :set_breadcrumb

  def index
    # タグの数は肥大化したらページネーション化する
    @tags = Tag.all

    set_meta_tags(
      title: 'タグ一覧',
      description: '管理しているタグ一覧です。'
    )
  end

  def show
    @tag = Tag.find_by(slug: params[:slug])
    @aritcles = @tag.articles.page(params[:page])
    add_breadcrumb "#{@tag.name}", tag_path(@tag.slug)

    set_meta_tags(
      title: @tag.name,
      description: @tag.desc
    )
  end

  private
    def set_breadcrumb
      add_breadcrumb 'タグ一覧', tags_path
    end
end
