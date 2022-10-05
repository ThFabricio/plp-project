class Tarefa < ApplicationRecord
  validates :nome, presence: true, length: {minimum: 5}
  validates :descricao, presence: true, length: {minimum: 10}
  validates :horaInicio, presence: true, comparison: {greater_than: Date.today, greater_than: Time.now}, uniqueness: true
  validates :horaFim, presence: true, comparison: {greater_than: Date.today, greater_than: Time.now}, uniqueness: true
end
