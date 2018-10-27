require 'test_helper'

class ClientBottlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @client_bottle = client_bottles(:one)
  end

  test "should get index" do
    get client_bottles_url, as: :json
    assert_response :success
  end

  test "should create client_bottle" do
    assert_difference('ClientBottle.count') do
      post client_bottles_url, params: { client_bottle: { bottle_id: @client_bottle.bottle_id, client_id: @client_bottle.client_id, quantity: @client_bottle.quantity } }, as: :json
    end

    assert_response 201
  end

  test "should show client_bottle" do
    get client_bottle_url(@client_bottle), as: :json
    assert_response :success
  end

  test "should update client_bottle" do
    patch client_bottle_url(@client_bottle), params: { client_bottle: { bottle_id: @client_bottle.bottle_id, client_id: @client_bottle.client_id, quantity: @client_bottle.quantity } }, as: :json
    assert_response 200
  end

  test "should destroy client_bottle" do
    assert_difference('ClientBottle.count', -1) do
      delete client_bottle_url(@client_bottle), as: :json
    end

    assert_response 204
  end
end
