class Atividade < ApplicationRecord
  has_many :atividade_categoriums
  has_many :categoriums, through: :atividade_categoriums

  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 10}
  validates :start_time, presence: true, comparison: {greater_than: Date.today}, uniqueness: true
  validates :end_time, presence: true, comparison: {greater_than: :start_time}, uniqueness: true
  validates :status, presence: true
end
