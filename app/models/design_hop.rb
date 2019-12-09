class DesignHop < ApplicationRecord
  belongs_to :venue
  has_one :location, through: :venue
  has_one :region, through: :location
  
  has_many :people
  has_many :organisations, through: :people
  has_many :interactions, through: :people
  has_many :hop_networks
  has_many :networks, through: :hop_networks
end
