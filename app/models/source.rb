class Source < ApplicationRecord
  has_many_attached :audio
  has_many :positions
end
