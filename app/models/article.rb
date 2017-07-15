class Article < ApplicationRecord
  # redisクライアントをwrapしてActiceRecord用に加工したredis-objectsを利用
  include Redis::Objects
  # sorted_set :views, global: true　とするとモデル全体へのDBになる
  sorted_set :views, global: true

  belongs_to :user

  has_many :article_tags
  has_many :tags, through: :article_tags

  accepts_nested_attributes_for :article_tags, allow_destroy: true

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true

  def increment_view
    self.class.views.increment(id)
  end

  def get_view_count
    self.class.views[id].to_i
  end
end
