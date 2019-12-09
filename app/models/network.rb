class Network < ApplicationRecord
  has_many :hop_networks
  has_many :design_hops, through: :hop_networks
end
