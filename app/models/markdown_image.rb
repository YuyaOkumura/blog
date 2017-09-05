class MarkdownImage < ApplicationRecord
  before_validation :set_image

  has_attached_file :image, storage: :s3,
                            s3_permissions: :private,
                            s3_credentials: "#{Rails.root}/config/settings/#{Rails.env}_s3.yml",
                            path: ":class/:attachment/:id/:style.:extension"

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def authenticated_image_url(style)
    image.s3_object(style).url_for(:read, secure: true)
  end

  def set_image
    file = Paperclip.io_adapters.for(image)
  end
end
