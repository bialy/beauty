# encoding: UTF-8 
class Price < ActiveRecord::Base
  belongs_to :offer
  attr_accessible :price, :offer_id, :discount, :category, :name
  
  def self.price_with_discounts
    @a = sum('price' '*' 'discount' '/' '100' )
    @wynik = sum('price') - @a 
  end
  
  CATEGORY_OPTIONS = ['Pielęgnacja dłoni', 'Pielęgnacja stóp', 'Pielęgnacja twarzy', 'Zabiegi firmowe (Rejuvi)', 'Zabiegi upiekszające', 'Makijaż okolicznościowy', 'Depilacja woskiem', 'Masaż']
  
end
