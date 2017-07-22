class ArticleImage < ApplicationRecord
  belongs_to :article

  has_attached_file :image, styles: {
                              large: "500x500>",
                              medium: "300x300>",
                              thumb: "100x100>"
                            },
                            storage: :s3,
                            s3_permissions: :private,
                            s3_credentials: "#{Rails.root}/config/settings/#{Rails.env}_s3.yml",
                            path: ":class/:attachment/:id/:style.:extension"

  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def authenticated_image_url(style)
    image.s3_object(style).url_for(:read, secure: true)
  end
end
