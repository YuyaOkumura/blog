class AddAttachmentImageToArticles < ActiveRecord::Migration
  def self.up
    change_table :articles do |t|
      t.attachment :main_image
    end
  end

  def self.down
    remove_attachment :articles, :main_image
  end
end
