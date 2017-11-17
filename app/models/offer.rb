class Offer < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history]
  has_many :treatments, :dependent => :destroy
  attr_accessible :name, :type, :avatar, :tags, :metaDesc, :picture
  
  has_attached_file :avatar,
                     :styles => {
                       :small  => "140x100>",
                       :medium => "300x300",
                       :thumb => "100x100",
                       :large => "640x480>",
                       :mini => "75x75>" },
      :url => "/assets/oferta/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/oferta/:id/:style/:basename.:extension"
  
  has_attached_file :picture,
                     :styles => {
                       :small => "140x100",
                       :medium => "300x300",
                       :large => "640x480>"
                       },
      :url => "/assets/oferta/:id/:style/:basename.:extension",
      :path => ":rails_root/public/assets/oferta/:id/:style/:basename.:extension"
  
  self.inheritance_column = :_type_disabled
  OFFER_OPTIONS = ['Ogolny', 'Twarz', 'Pielegnacyjne', 'Masaz']  
  validates_presence_of :name
  has_one :price, :dependent => :destroy
end
