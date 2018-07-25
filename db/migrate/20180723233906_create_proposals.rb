class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.date :booked_date
      t.time :start_hour
      t.time :end_hour
      t.text :message
      t.references :au_pair, foreign_key: true

      t.timestamps
    end
  end
end
