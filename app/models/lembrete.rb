class Lembrete < ApplicationRecord
  has_many :lembrete_categoriums
  has_many :categoriums, through: :lembrete_categoriums

  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 10}
  validates :dia, presence: true, comparison: {greater_than: Date.today}, uniqueness: true
end
