class Metum < ApplicationRecord
  has_many :meta_categoriums
  has_many :categoriums, through: :meta_categoriums

  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 10}
  validates :status, presence: true
end
