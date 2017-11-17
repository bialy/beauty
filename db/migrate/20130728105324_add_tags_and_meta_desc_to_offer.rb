class AddTagsAndMetaDescToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :tags, :string
    add_column :offers, :metaDesc, :string
  end
end
