require 'test_helper'

class ClassroomSchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @classroom_schedule = classroom_schedules(:one)
  end

  test "should get index" do
    get classroom_schedules_url, as: :json
    assert_response :success
  end

  test "should create classroom_schedule" do
    assert_difference('ClassroomSchedule.count') do
      post classroom_schedules_url, params: { classroom_schedule: { classroom_id: @classroom_schedule.classroom_id, cyclic_schedule_id: @classroom_schedule.cyclic_schedule_id, group_id: @classroom_schedule.group_id } }, as: :json
    end

    assert_response 201
  end

  test "should show classroom_schedule" do
    get classroom_schedule_url(@classroom_schedule), as: :json
    assert_response :success
  end

  test "should update classroom_schedule" do
    patch classroom_schedule_url(@classroom_schedule), params: { classroom_schedule: { classroom_id: @classroom_schedule.classroom_id, cyclic_schedule_id: @classroom_schedule.cyclic_schedule_id, group_id: @classroom_schedule.group_id } }, as: :json
    assert_response 200
  end

  test "should destroy classroom_schedule" do
    assert_difference('ClassroomSchedule.count', -1) do
      delete classroom_schedule_url(@classroom_schedule), as: :json
    end

    assert_response 204
  end
end
