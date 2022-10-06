class Metum < ApplicationRecord
  has_many :meta_categoriums
  has_many :categoriums, through: :meta_categoriums

  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 10}
  validates :status, presence: true
  validates :frequencia, presence: true
  validates :start_time, presence: true, comparison: {greater_than: Date.today}, uniqueness: true
  validates :end_time, presence: true, comparison: {greater_than: :start_time}, uniqueness: true
  
end
