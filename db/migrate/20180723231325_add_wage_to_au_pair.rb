class AddWageToAuPair < ActiveRecord::Migration[5.2]
  def change
    add_column :au_pairs, :wage, :decimal
  end
end
