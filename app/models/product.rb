class Product < ApplicationRecord
  belongs_to :user
  has_many :contents
  has_many :machine_products
  has_many :machines, through: :machine_products
end
