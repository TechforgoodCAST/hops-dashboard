class Organisation < ApplicationRecord
  has_many :people
  
  include Regions
  
  enum income: {
    '<£10k': 0,
    '£10k - £50k': 10000,
    '£51k- £100k': 51000,
    '£101k - £500k': 101000,
    '£501k - £1m': 501000,
    '£1.1m - £5m': 1100000,
    '£5.1m - £10m': 5100000,
    '£10.1m - £50m': 10100000,
    '£50.1m - £100m': 50100000,
    '£100m+': 100000000
  }
end
