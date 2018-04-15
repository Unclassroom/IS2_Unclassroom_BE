require 'test_helper'

class CyclicSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cyclic_schedule = cyclic_schedules(:one)
  end

  test "should get index" do
    get cyclic_schedules_url, as: :json
    assert_response :success
  end

  test "should create cyclic_schedule" do
    assert_difference('CyclicSchedule.count') do
      post cyclic_schedules_url, params: { cyclic_schedule: { begin_at: @cyclic_schedule.begin_at, day: @cyclic_schedule.day, end_at: @cyclic_schedule.end_at } }, as: :json
    end

    assert_response 201
  end

  test "should show cyclic_schedule" do
    get cyclic_schedule_url(@cyclic_schedule), as: :json
    assert_response :success
  end

  test "should update cyclic_schedule" do
    patch cyclic_schedule_url(@cyclic_schedule), params: { cyclic_schedule: { begin_at: @cyclic_schedule.begin_at, day: @cyclic_schedule.day, end_at: @cyclic_schedule.end_at } }, as: :json
    assert_response 200
  end

  test "should destroy cyclic_schedule" do
    assert_difference('CyclicSchedule.count', -1) do
      delete cyclic_schedule_url(@cyclic_schedule), as: :json
    end

    assert_response 204
  end
end
