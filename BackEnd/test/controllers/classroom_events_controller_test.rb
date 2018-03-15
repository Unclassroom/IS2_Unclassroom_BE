require 'test_helper'

class ClassroomEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classroom_event = classroom_events(:one)
  end

  test "should get index" do
    get classroom_events_url, as: :json
    assert_response :success
  end

  test "should create classroom_event" do
    assert_difference('ClassroomEvent.count') do
      post classroom_events_url, params: { classroom_event: { classroom_id: @classroom_event.classroom_id, event_id: @classroom_event.event_id, specific_id: @classroom_event.specific_id } }, as: :json
    end

    assert_response 201
  end

  test "should show classroom_event" do
    get classroom_event_url(@classroom_event), as: :json
    assert_response :success
  end

  test "should update classroom_event" do
    patch classroom_event_url(@classroom_event), params: { classroom_event: { classroom_id: @classroom_event.classroom_id, event_id: @classroom_event.event_id, specific_id: @classroom_event.specific_id } }, as: :json
    assert_response 200
  end

  test "should destroy classroom_event" do
    assert_difference('ClassroomEvent.count', -1) do
      delete classroom_event_url(@classroom_event), as: :json
    end

    assert_response 204
  end
end
