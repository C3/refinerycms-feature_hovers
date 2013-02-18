class AddLinkToFeatureHovers < ActiveRecord::Migration
  def change
    add_column :refinery_feature_hovers, :link, :string
  end
end
