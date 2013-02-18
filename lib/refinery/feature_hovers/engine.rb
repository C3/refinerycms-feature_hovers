module Refinery
  module FeatureHovers
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::FeatureHovers

      engine_name :refinery_feature_hovers

      initializer "register refinerycms_feature_hovers plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "feature_hovers"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.feature_hovers_admin_feature_hovers_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/feature_hovers/feature_hover'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::FeatureHovers)
      end
    end
  end
end
