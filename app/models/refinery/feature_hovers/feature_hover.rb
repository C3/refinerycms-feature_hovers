module Refinery
  module FeatureHovers
    class FeatureHover < Refinery::Core::BaseModel
      self.table_name = 'refinery_feature_hovers'

      attr_accessible :title, :description, :position, :link

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
