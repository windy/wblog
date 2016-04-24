class CreateSubscribes < ActiveRecord::Migration[5.0]
  def change
    create_table :subscribes do |t|
      t.string :email
      t.boolean :enable

      t.timestamps
    end
  end
end
