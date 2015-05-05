class RenameArchiveInLists < ActiveRecord::Migration
  def change
    rename_column :lists, :achived, :archived
  end
end
