class CreateMachineProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :machine_products do |t|
      t.references :machine, foreign_key: true
      t.references :product, foreign_key: true
      t.timestamps
    end
  end
end
