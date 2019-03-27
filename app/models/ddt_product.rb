# frozen_string_literal: true

# app/models/customer.rb
class DdtProduct < ApplicationRecord
  belongs_to :ddt
  belongs_to :product
end
