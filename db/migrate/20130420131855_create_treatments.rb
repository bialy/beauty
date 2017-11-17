class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.text :content
      t.references :offer

      t.timestamps
    end
    add_index :treatments, :offer_id
  end
end
