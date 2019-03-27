# frozen_string_literal: true

# app/models/customer.rb
class Customer < ApplicationRecord
  has_many :customer_products
  has_many :products, through: :customer_product
  has_many :ddts

end
