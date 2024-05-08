class ChangePriceToBeIntegerInSurfboards < ActiveRecord::Migration[7.1]
  def up
    change_column :surfboards, :price, 'integer USING price::integer'
  end

  def down
    change_column :surfboards, :price, :string
  end
end
