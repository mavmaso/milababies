class AuPair < ApplicationRecord
  has_many :testimonials
  validates :name, :email, :phone, :cpf, :skills, :languages, :degree,
            :birth_date, :city, presence: true
  validates :cpf, uniqueness: true
  has_attached_file :photo, styles: { thumb: '100x100#' }
  validates_attachment_content_type :photo, content_type: %r{\Aimage\/.*\z}


  def average_rating 
   testimonials.average(:rating)&.round(2)
  end






end


