class AddAttachmentPhotoToAuPairs < ActiveRecord::Migration[5.2]
  def self.up
    change_table :au_pairs do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :au_pairs, :photo
  end
end
