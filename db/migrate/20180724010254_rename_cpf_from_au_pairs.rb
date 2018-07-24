class RenameCpfFromAuPairs < ActiveRecord::Migration[5.2]
  def change
    rename_column :au_pairs, :CPF, :cpf
  end
end
