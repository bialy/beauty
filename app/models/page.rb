class Page < ActiveRecord::Base
  attr_accessible :name, :permalink, :content, :photo
  
  has_attached_file :photo,
                     :styles => {
                       :small => "140x100",
                       :large => "640x480>"
                       },
      :url => "/assets/promocja/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/promocja/:id/:style/:basename.:extension"
      
end
