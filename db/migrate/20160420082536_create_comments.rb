class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :name
      t.string :email
      t.text :content
      t.references :post

      t.timestamps
    end
  end
end
