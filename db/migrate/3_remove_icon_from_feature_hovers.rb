class RemoveIconFromFeatureHovers < ActiveRecord::Migration
  def change
    remove_column :refinery_feature_hovers, :icon_id
  end
end
