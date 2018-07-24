class Proposal < ApplicationRecord
  belongs_to :au_pair
  before_save :calculate_final_price

  def calculate_final_price
    self.final_price = au_pair.wage * (((end_hour - start_hour)/60)/60).to_i
  end
end
