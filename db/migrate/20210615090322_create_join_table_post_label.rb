class CreateJoinTablePostLabel < ActiveRecord::Migration[6.1]
  def change
    create_join_table :posts, :labels do |t|
      t.index [:post_id, :label_id]
      t.index [:label_id, :post_id]
    end
  end
end
