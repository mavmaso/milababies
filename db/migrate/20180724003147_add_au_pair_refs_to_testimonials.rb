class AddAuPairRefsToTestimonials < ActiveRecord::Migration[5.2]
  def change
    add_reference :testimonials, :au_pair, foreign_key: true
  end
end
