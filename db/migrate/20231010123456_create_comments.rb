# db/migrate/20231010123456_create_comments.rb

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.string :author, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
