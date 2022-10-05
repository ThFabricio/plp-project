class Metum < ApplicationRecord
  belongs_to :categorium
  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 10}
end
