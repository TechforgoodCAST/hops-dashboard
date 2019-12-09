class CrewLocation < ApplicationRecord
  belongs_to :crew
  belongs_to :location
end
