class AddCategoryAndNameToPrice < ActiveRecord::Migration
  def change
    add_column :prices, :name, :string
    add_column :prices, :category, :string
  end
end
