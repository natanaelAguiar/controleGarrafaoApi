require 'test_helper'

class BottlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bottle = bottles(:one)
  end

  test "should get index" do
    get bottles_url, as: :json
    assert_response :success
  end

  test "should create bottle" do
    assert_difference('Bottle.count') do
      post bottles_url, params: { bottle: { name: @bottle.name } }, as: :json
    end

    assert_response 201
  end

  test "should show bottle" do
    get bottle_url(@bottle), as: :json
    assert_response :success
  end

  test "should update bottle" do
    patch bottle_url(@bottle), params: { bottle: { name: @bottle.name } }, as: :json
    assert_response 200
  end

  test "should destroy bottle" do
    assert_difference('Bottle.count', -1) do
      delete bottle_url(@bottle), as: :json
    end

    assert_response 204
  end
end
