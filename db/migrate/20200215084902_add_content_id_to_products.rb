class AddContentIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :content_id, :integer
  end
end
