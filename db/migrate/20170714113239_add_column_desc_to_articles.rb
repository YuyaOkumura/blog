class AddColumnDescToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :desc, :text
  end
end
