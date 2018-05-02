require 'test_helper'

class AutoRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auto_request = auto_requests(:one)
  end

  test "should get index" do
    get auto_requests_url, as: :json
    assert_response :success
  end

  test "should create auto_request" do
    assert_difference('AutoRequest.count') do
      post auto_requests_url, params: { auto_request: { file: @auto_request.file } }, as: :json
    end

    assert_response 201
  end

  test "should show auto_request" do
    get auto_request_url(@auto_request), as: :json
    assert_response :success
  end

  test "should update auto_request" do
    patch auto_request_url(@auto_request), params: { auto_request: { file: @auto_request.file } }, as: :json
    assert_response 200
  end

  test "should destroy auto_request" do
    assert_difference('AutoRequest.count', -1) do
      delete auto_request_url(@auto_request), as: :json
    end

    assert_response 204
  end
end
