class Donation < ApplicationRecord
  belongs_to :organization
  belongs_to :food
end
