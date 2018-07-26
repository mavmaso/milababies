class AddUserToTestimonials < ActiveRecord::Migration[5.2]
  def change
    add_reference :testimonials, :user, foreign_key: true
  end
end
