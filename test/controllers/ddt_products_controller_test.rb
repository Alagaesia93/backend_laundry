require 'test_helper'

class DdtProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ddt_product = ddt_products(:one)
  end

  test "should get index" do
    get ddt_products_url, as: :json
    assert_response :success
  end

  test "should create ddt_product" do
    assert_difference('DdtProduct.count') do
      post ddt_products_url, params: { ddt_product: { ddt_id: @ddt_product.ddt_id, product_id: @ddt_product.product_id, quantity: @ddt_product.quantity } }, as: :json
    end

    assert_response 201
  end

  test "should show ddt_product" do
    get ddt_product_url(@ddt_product), as: :json
    assert_response :success
  end

  test "should update ddt_product" do
    patch ddt_product_url(@ddt_product), params: { ddt_product: { ddt_id: @ddt_product.ddt_id, product_id: @ddt_product.product_id, quantity: @ddt_product.quantity } }, as: :json
    assert_response 200
  end

  test "should destroy ddt_product" do
    assert_difference('DdtProduct.count', -1) do
      delete ddt_product_url(@ddt_product), as: :json
    end

    assert_response 204
  end
end
