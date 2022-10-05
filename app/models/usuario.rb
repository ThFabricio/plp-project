class Usuario < ApplicationRecord
  validates :userName, presence: true, length: {minimum: 5}
  validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}, uniqueness: true
  validates :senha, presence: true, length: {minimum: 6}
end
