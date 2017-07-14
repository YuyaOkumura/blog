class Article < ApplicationRecord
  belongs_to :user

  has_many :article_tags
  has_many :tags, through: :article_tags

  accepts_nested_attributes_for :article_tags, allow_destroy: true

  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
