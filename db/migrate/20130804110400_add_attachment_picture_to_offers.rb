class AddAttachmentPictureToOffers < ActiveRecord::Migration
  def self.up
    change_table :offers do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :offers, :picture
  end
end
