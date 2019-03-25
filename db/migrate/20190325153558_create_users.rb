# frozen_string_literal: true

# db/migrate/createUsers
class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :full_name, null: false
      t.integer :role, default: 0

      t.timestamps
    end
  end
end
