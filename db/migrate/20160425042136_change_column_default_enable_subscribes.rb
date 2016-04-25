class ChangeColumnDefaultEnableSubscribes < ActiveRecord::Migration[5.0]
  def change
    change_column_default :subscribes, :enable, true
  end
end
