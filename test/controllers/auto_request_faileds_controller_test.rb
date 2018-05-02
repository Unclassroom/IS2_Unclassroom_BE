require 'test_helper'

class AutoRequestFailedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auto_request_failed = auto_request_faileds(:one)
  end

  test "should get index" do
    get auto_request_faileds_url, as: :json
    assert_response :success
  end

  test "should create auto_request_failed" do
    assert_difference('AutoRequestFailed.count') do
      post auto_request_faileds_url, params: { auto_request_failed: { auto_request_id: @auto_request_failed.auto_request_id, building: @auto_request_failed.building, classroom: @auto_request_failed.classroom, code: @auto_request_failed.code, day: @auto_request_failed.day, group: @auto_request_failed.group, time: @auto_request_failed.time } }, as: :json
    end

    assert_response 201
  end

  test "should show auto_request_failed" do
    get auto_request_failed_url(@auto_request_failed), as: :json
    assert_response :success
  end

  test "should update auto_request_failed" do
    patch auto_request_failed_url(@auto_request_failed), params: { auto_request_failed: { auto_request_id: @auto_request_failed.auto_request_id, building: @auto_request_failed.building, classroom: @auto_request_failed.classroom, code: @auto_request_failed.code, day: @auto_request_failed.day, group: @auto_request_failed.group, time: @auto_request_failed.time } }, as: :json
    assert_response 200
  end

  test "should destroy auto_request_failed" do
    assert_difference('AutoRequestFailed.count', -1) do
      delete auto_request_failed_url(@auto_request_failed), as: :json
    end

    assert_response 204
  end
end
