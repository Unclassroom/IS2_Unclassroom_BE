require 'test_helper'

class SpecificSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specific_schedule = specific_schedules(:one)
  end

  test "should get index" do
    get specific_schedules_url, as: :json
    assert_response :success
  end

  test "should create specific_schedule" do
    assert_difference('SpecificSchedule.count') do
      post specific_schedules_url, params: { specific_schedule: { begin_at: @specific_schedule.begin_at, day: @specific_schedule.day, end_at: @specific_schedule.end_at } }, as: :json
    end

    assert_response 201
  end

  test "should show specific_schedule" do
    get specific_schedule_url(@specific_schedule), as: :json
    assert_response :success
  end

  test "should update specific_schedule" do
    patch specific_schedule_url(@specific_schedule), params: { specific_schedule: { begin_at: @specific_schedule.begin_at, day: @specific_schedule.day, end_at: @specific_schedule.end_at } }, as: :json
    assert_response 200
  end

  test "should destroy specific_schedule" do
    assert_difference('SpecificSchedule.count', -1) do
      delete specific_schedule_url(@specific_schedule), as: :json
    end

    assert_response 204
  end
end
