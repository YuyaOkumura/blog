class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :user_name
      t.string :title, null: false
      t.string :content, null: false

      t.timestamps
    end
  end
end
