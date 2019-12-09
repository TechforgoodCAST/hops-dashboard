class Interaction < ApplicationRecord
  belongs_to :person
  enum action_type: { maturity: 1 }
end
