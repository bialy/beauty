class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :price, :precision => '8', :scale => '2'
      t.integer :discount
      t.references :offer

      t.timestamps
    end
    add_index :prices, :offer_id
  end
end
