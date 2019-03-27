# frozen_string_literal: true

# app/models/customer.rb
class Product < ApplicationRecord
  has_many :customer_products
  has_many :customers, through: :customer_products
end
