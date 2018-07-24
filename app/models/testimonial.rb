class Testimonial < ApplicationRecord
  belongs_to :au_pair

  validates :title, :description, presence: { message: 'Você deve preencher todos os campos' }
end
