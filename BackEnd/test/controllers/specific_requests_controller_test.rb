require 'test_helper'

class SpecificRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specific_request = specific_requests(:one)
  end

  test "should get index" do
    get specific_requests_url, as: :json
    assert_response :success
  end

  test "should create specific_request" do
    assert_difference('SpecificRequest.count') do
      post specific_requests_url, params: { specific_request: { request_alternative_id: @specific_request.request_alternative_id, specific_schedule_id: @specific_request.specific_schedule_id } }, as: :json
    end

    assert_response 201
  end

  test "should show specific_request" do
    get specific_request_url(@specific_request), as: :json
    assert_response :success
  end

  test "should update specific_request" do
    patch specific_request_url(@specific_request), params: { specific_request: { request_alternative_id: @specific_request.request_alternative_id, specific_schedule_id: @specific_request.specific_schedule_id } }, as: :json
    assert_response 200
  end

  test "should destroy specific_request" do
    assert_difference('SpecificRequest.count', -1) do
      delete specific_request_url(@specific_request), as: :json
    end

    assert_response 204
  end
end
