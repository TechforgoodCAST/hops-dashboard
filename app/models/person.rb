class Person < ApplicationRecord
  belongs_to :design_hop
  belongs_to :organisation
  has_many :interactions
  
  include Regions
end
