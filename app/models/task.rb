class Task < ApplicationRecord
  validates :name, :beginning, :end, :estimated_cost, :status, presence: true
  validates :name, length: { minimum: 5 }
  validates :name, length: { maximum: 50 }
  has_many :commentaries
end
