class CreateLabelsPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :labels_posts, id: false do |t|
      t.integer :label_id
      t.integer :post_id
    end
  end
end
