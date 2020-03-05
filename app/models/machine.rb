class Machine < ApplicationRecord
  has_many :machine_products
  has_many :products, through: :machine_products
  validates :name, presence: true, uniqueness: true
end
