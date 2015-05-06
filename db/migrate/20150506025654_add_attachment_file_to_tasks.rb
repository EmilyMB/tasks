class AddAttachmentFileToTasks < ActiveRecord::Migration
  def self.up
    change_table :tasks do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :tasks, :file
  end
end
