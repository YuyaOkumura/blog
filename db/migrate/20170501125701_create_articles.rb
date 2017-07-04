class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :user, foreign_key: true, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.boolean :is_public, null: false, default: false

      t.timestamps
    end
  end
end
