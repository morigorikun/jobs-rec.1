class MachineProduct < ApplicationRecord
  belongs_to :machine
  belongs_to :product
end
