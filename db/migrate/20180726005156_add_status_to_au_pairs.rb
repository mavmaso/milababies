class AddStatusToAuPairs < ActiveRecord::Migration[5.2]
  def change
    add_column :au_pairs, :status, :integer
  end
end
