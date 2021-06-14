class CreateAdministrators < ActiveRecord::Migration[6.1]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
    add_index :administrators, :name, unique: true
  end
end
