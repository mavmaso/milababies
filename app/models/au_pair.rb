class AuPair < ApplicationRecord
  has_many :proposals, dependent: :destroy
  validates :name, :email, :phone, :cpf, :skills, :languages, :degree,
            :birth_date, :city, :wage, presence: true
  validates :cpf, uniqueness: true
  has_attached_file :photo, styles: { thumb: '100x100#' }
  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\z}
  validates :photo, attachment_presence: true
end
