class Testimonial < ApplicationRecord
  belongs_to :au_pair

  validates :title, :description, presence: true
end
