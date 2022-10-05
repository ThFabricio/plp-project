class Lembrete < ApplicationRecord
  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 10}
  validates :dia, presence: true, comparison: {greater_than: Date.today}, uniqueness: true
end
