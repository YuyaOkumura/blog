class TagsController < ApplicationController
  def index
    # タグの数は肥大化したらページネーション化する
    @tags = Tag.all
  end

  def show
    @tag = Tag.find_by(slug: params[:slug])
  end
end
