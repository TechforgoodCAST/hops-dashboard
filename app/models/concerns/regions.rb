module Regions
  extend ActiveSupport::Concern
  included do
    enum region: [
    'London',
    'North East',
    'North West',
    'Yorkshire and the Humber',
    'West Midlands',
    'East Midlands',
    'South West',
    'South East',
    'East of England',
    'Wales',
    'Scotland',
    'Northern Ireland'
  ]
  end
end  