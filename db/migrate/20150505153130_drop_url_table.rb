class DropUrlTable < ActiveRecord::Migration
  def change
    drop_table :urls
  end
end
