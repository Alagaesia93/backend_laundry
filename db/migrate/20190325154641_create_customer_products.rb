class CreateCustomerProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_products do |t|
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :min_size
      t.integer :price

      t.timestamps
    end
  end
end
