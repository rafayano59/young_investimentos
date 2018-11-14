class Investimento < ApplicationRecord
  validates :titulo, presence: true, length: {minimum: 3, maximum: 25}
  validates :valor, presence: true
  validates :nivel, presence: true

end
