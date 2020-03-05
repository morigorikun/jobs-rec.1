class AddMachineToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :machine, :string
  end
end
