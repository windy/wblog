class RenameColumnContentToComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :conent, :content
  end
end
