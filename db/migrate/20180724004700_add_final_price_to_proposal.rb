class AddFinalPriceToProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :final_price, :decimal
  end
end
