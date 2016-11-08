class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer :code
      t.string :name
      t.decimal :price
      t.string :vat_rate

      t.timestamps

      t.index :code
    end
  end
end
