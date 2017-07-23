class CreateMarkdownImages < ActiveRecord::Migration[5.0]
  def change
    create_table :markdown_images do |t|
      t.timestamps
    end
  end
end
