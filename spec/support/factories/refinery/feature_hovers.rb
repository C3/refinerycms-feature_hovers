
FactoryGirl.define do
  factory :feature_hover, :class => Refinery::FeatureHovers::FeatureHover do
    sequence(:title) { |n| "refinery#{n}" }
  end
end

