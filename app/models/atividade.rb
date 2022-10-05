class Atividade < ApplicationRecord
  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 10}
  validates :start_time, presence: true, comparison: {greater_than: Date.today, greater_than: Time.now}, uniqueness: true
  validates :end_time, presence: true, comparison: {greater_than: Date.today, greater_than: Time.now}, uniqueness: true
end
