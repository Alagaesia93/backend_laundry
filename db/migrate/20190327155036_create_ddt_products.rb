class CreateDdtProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ddt_products do |t|
      t.references :ddt, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
