class CreateFeatureHoversFeatureHovers < ActiveRecord::Migration

  def up
    create_table :refinery_feature_hovers do |t|
      t.string :title
      t.integer :icon_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-feature_hovers"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/feature_hovers/feature_hovers"})
    end

    drop_table :refinery_feature_hovers

  end

end
