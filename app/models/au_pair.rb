class AuPair < ApplicationRecord
  has_many :proposals
  has_attached_file :photo, styles: { thumb: "100x100#" }

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
