class AddAttachmentAvatarToOffers < ActiveRecord::Migration
  def self.up
    change_table :offers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :offers, :avatar
  end
end
