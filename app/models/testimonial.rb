class Testimonial < ApplicationRecord
  belongs_to :au_pair
  belongs_to :user

  validates :title, :description, presence: true
end
