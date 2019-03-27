require 'test_helper'

class DdtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @ddt = ddts(:one)
  end

  test "should get index" do
    get ddts_url, as: :json
    assert_response :success
  end

  test "should create ddt" do
    assert_difference('Ddt.count') do
      post ddts_url, params: { ddt: { customer_id: @ddt.customer_id, user_id: @ddt.user_id } }, as: :json
    end

    assert_response 201
  end

  test "should show ddt" do
    get ddt_url(@ddt), as: :json
    assert_response :success
  end

  test "should update ddt" do
    patch ddt_url(@ddt), params: { ddt: { customer_id: @ddt.customer_id, user_id: @ddt.user_id } }, as: :json
    assert_response 200
  end

  test "should destroy ddt" do
    assert_difference('Ddt.count', -1) do
      delete ddt_url(@ddt), as: :json
    end

    assert_response 204
  end
end
