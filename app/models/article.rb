class Article < ApplicationRecord
  belongs_to :user

  has_many :article_tags
  has_many :favorites
end
