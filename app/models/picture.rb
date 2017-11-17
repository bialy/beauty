class Picture < ActiveRecord::Base
  belongs_to :gallery
  attr_accessible :name, :gallery_id, :photo
  
  has_attached_file :photo,
                     :styles => {
                       :medium => "300x300",
                       :thumb => "100x100",
                       :large => "640x480>" },
      :url => "/assets/galeria/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/galeria/:id/:style/:basename.:extension"
  
end
