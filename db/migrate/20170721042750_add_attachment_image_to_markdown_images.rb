class AddAttachmentImageToMarkdownImages < ActiveRecord::Migration
  def self.up
    change_table :markdown_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :markdown_images, :image
  end
end
