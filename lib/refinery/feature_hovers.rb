require 'refinerycms-core'

module Refinery
  autoload :FeatureHoversGenerator, 'generators/refinery/feature_hovers_generator'

  module FeatureHovers
    require 'refinery/feature_hovers/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
