class AddDiscountToProduct < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :discount, :string
  end
end
