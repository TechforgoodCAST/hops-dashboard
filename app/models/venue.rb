class Venue < ApplicationRecord
  belongs_to :location  
  has_many :design_hops
  geocoded_by :address
  after_validation :geocode
end
