class Task < ActiveRecord::Base
  belongs_to :list
  validates :title, presence: true
  has_attached_file :file, default_url: ""
  validates_attachment_content_type :file,
    content_type: ["image/jpeg", "image/gif", "image/png", "application/pdf"],
    size: { in: 0.. 2.megabytes }
end
