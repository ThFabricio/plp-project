class Categorium < ApplicationRecord
  validates :nome, presence: true, length: {minimun: 5}
  validates :descricao, presence: true, length: {minimun: 10}
  validates :cor, presence: true, length: {is: 7}, uniqueness: true
end
