require 'test_helper'

class DeparmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deparment = deparments(:one)
  end

  test "should get index" do
    get deparments_url, as: :json
    assert_response :success
  end

  test "should create deparment" do
    assert_difference('Deparment.count') do
      post deparments_url, params: { deparment: { faculty_id: @deparment.faculty_id, name: @deparment.name, teacher_id: @deparment.teacher_id } }, as: :json
    end

    assert_response 201
  end

  test "should show deparment" do
    get deparment_url(@deparment), as: :json
    assert_response :success
  end

  test "should update deparment" do
    patch deparment_url(@deparment), params: { deparment: { faculty_id: @deparment.faculty_id, name: @deparment.name, teacher_id: @deparment.teacher_id } }, as: :json
    assert_response 200
  end

  test "should destroy deparment" do
    assert_difference('Deparment.count', -1) do
      delete deparment_url(@deparment), as: :json
    end

    assert_response 204
  end
end
