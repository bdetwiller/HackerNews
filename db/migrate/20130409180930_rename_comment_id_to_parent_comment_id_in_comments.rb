class RenameCommentIdToParentCommentIdInComments < ActiveRecord::Migration
  def change
    rename_column :comments, :comment_id, :parent_id
  end
end
