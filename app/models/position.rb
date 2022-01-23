class Position < ApplicationRecord
  belongs_to :project
  belongs_to :positionee, polymorphic: true
end
