class CreateDdts < ActiveRecord::Migration[5.2]
  def change
    create_table :ddts do |t|
      t.references :user, foreign_key: true
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
