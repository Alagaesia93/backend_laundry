require 'test_helper'

class CustomerProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @customer_product = customer_products(:one)
  end

  test "should get index" do
    get customer_products_url, as: :json
    assert_response :success
  end

  test "should create customer_product" do
    assert_difference('CustomerProduct.count') do
      post customer_products_url, params: { customer_product: { customer_id: @customer_product.customer_id, min_size: @customer_product.min_size, price: @customer_product.price, product_id: @customer_product.product_id } }, as: :json
    end

    assert_response 201
  end

  test "should show customer_product" do
    get customer_product_url(@customer_product), as: :json
    assert_response :success
  end

  test "should update customer_product" do
    patch customer_product_url(@customer_product), params: { customer_product: { customer_id: @customer_product.customer_id, min_size: @customer_product.min_size, price: @customer_product.price, product_id: @customer_product.product_id } }, as: :json
    assert_response 200
  end

  test "should destroy customer_product" do
    assert_difference('CustomerProduct.count', -1) do
      delete customer_product_url(@customer_product), as: :json
    end

    assert_response 204
  end
end
