class Location < ApplicationRecord
  has_many :venues
  has_many :design_hops, through: :venues
  has_many :crew_locations
  has_many :crew, through: :crew_locations
  belongs_to :region

end
