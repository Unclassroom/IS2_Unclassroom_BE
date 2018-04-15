require 'test_helper'

class CyclicRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cyclic_request = cyclic_requests(:one)
  end

  test "should get index" do
    get cyclic_requests_url, as: :json
    assert_response :success
  end

  test "should create cyclic_request" do
    assert_difference('CyclicRequest.count') do
      post cyclic_requests_url, params: { cyclic_request: { cyclic_schedule_id: @cyclic_request.cyclic_schedule_id, request_alternative_id: @cyclic_request.request_alternative_id } }, as: :json
    end

    assert_response 201
  end

  test "should show cyclic_request" do
    get cyclic_request_url(@cyclic_request), as: :json
    assert_response :success
  end

  test "should update cyclic_request" do
    patch cyclic_request_url(@cyclic_request), params: { cyclic_request: { cyclic_schedule_id: @cyclic_request.cyclic_schedule_id, request_alternative_id: @cyclic_request.request_alternative_id } }, as: :json
    assert_response 200
  end

  test "should destroy cyclic_request" do
    assert_difference('CyclicRequest.count', -1) do
      delete cyclic_request_url(@cyclic_request), as: :json
    end

    assert_response 204
  end
end
