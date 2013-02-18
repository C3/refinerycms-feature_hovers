module Refinery
  module FeatureHovers
    module Admin
      class FeatureHoversController < ::Refinery::AdminController

        crudify :'refinery/feature_hovers/feature_hover', :xhr_paging => true

      end
    end
  end
end
