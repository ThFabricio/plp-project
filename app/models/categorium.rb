class Categorium < ApplicationRecord
  has_many :lembretes
  has_many :metum
  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 10}
  validates :cor, presence: true, length: {is: 7}, uniqueness: true
end
