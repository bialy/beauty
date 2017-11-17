class AddCounterToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :visits_count, :int
  end
end
