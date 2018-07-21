class CreateAuPairs < ActiveRecord::Migration[5.2]
  def change
    create_table :au_pairs do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :social_media
      t.string :CPF
      t.text :skills
      t.string :degree
      t.string :languages
      t.date :birth_date
      t.string :city
      t.integer :rate

      t.timestamps
    end
  end
end
