class Crew < ApplicationRecord
  has_many :crew_locations
  has_many :locations, through: :crew_locations
  has_many :regions, through: :locations
  
  has_many :networks, through: :crew_network
  has_many :design_hops, through: :crew_hop
end
