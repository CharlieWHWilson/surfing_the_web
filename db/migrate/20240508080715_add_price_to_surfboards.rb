class AddPriceToSurfboards < ActiveRecord::Migration[7.1]
  def change
    add_column :surfboards, :price, :string
  end
end
