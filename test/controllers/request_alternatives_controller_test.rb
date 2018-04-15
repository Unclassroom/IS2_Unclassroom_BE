require 'test_helper'

class RequestAlternativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @request_alternative = request_alternatives(:one)
  end

  test "should get index" do
    get request_alternatives_url, as: :json
    assert_response :success
  end

  test "should create request_alternative" do
    assert_difference('RequestAlternative.count') do
      post request_alternatives_url, params: { request_alternative: { request_id: @request_alternative.request_id } }, as: :json
    end

    assert_response 201
  end

  test "should show request_alternative" do
    get request_alternative_url(@request_alternative), as: :json
    assert_response :success
  end

  test "should update request_alternative" do
    patch request_alternative_url(@request_alternative), params: { request_alternative: { request_id: @request_alternative.request_id } }, as: :json
    assert_response 200
  end

  test "should destroy request_alternative" do
    assert_difference('RequestAlternative.count', -1) do
      delete request_alternative_url(@request_alternative), as: :json
    end

    assert_response 204
  end
end
