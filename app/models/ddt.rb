# frozen_string_literal: true

# app/models/customer.rb
class Ddt < ApplicationRecord
  belongs_to :user
  belongs_to :customer

  has_many :ddt_products
  has_many :products, through: :ddt_products
end
