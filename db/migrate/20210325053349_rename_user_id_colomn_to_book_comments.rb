class RenameUserIdColomnToBookComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :book_comments, :user_id, :book_id
  end
end
