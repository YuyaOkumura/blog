class Like < ApplicationRecord
  belongs_to :article

  validates :user_token, uniqueness: {scope: :article_id}
end
