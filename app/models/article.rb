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

  # paperclip setting
  has_attached_file :main_image, styles: {
                              medium: "300x300>",
                              thumb: "100x100>"
                            },
                            storage: :s3,
                            s3_permissions: :private,
                            s3_credentials: "#{Rails.root}/config/settings/#{Rails.env}_s3.yml",
                            path: ":class/:attachment/:id/:style.:extension"

  validates_attachment_content_type :main_image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def authenticated_image_url(style)
    main_image.s3_object(style).url_for(:read, secure: true)
  end

  # redis setting
  def increment_view
    self.class.views.increment(id)
  end

  def get_view_count
    self.class.views[id].to_i
  end

  class << self
    def get_pv_ranking(range = 3)
      ids = views.revrange(0, (range - 1))
      ids.map { |id| find(id) }
    end
  end
end
