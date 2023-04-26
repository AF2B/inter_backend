class Ong < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :cnpj, presence: true, uniqueness: true
end
