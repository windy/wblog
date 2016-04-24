class ChangeColumnDefaultVisitedCountToPosts < ActiveRecord::Migration[5.0]
  def change
    change_column_default :posts, :visited_count, 0
  end
end
