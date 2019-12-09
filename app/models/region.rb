class Region < ApplicationRecord
  has_many :locations
  has_many :venues, through: :locations
  has_many :design_hops, through: :venues
  has_many :people, through: :design_hops
  has_many :interactions, through: :people
  has_many :organisations, through: :people
  has_many :networks, through: :design_hops
  
  has_many :crew_locations, through: :locations
  has_many :crews, through: :crew_locations
end
