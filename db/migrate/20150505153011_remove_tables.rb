class RemoveTables < ActiveRecord::Migration
  def change
    drop_table :links
    drop_table :degrees
  end
end
