require 'test_helper'

class PurposeClassroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @purpose_classroom = purpose_classrooms(:one)
  end

  test "should get index" do
    get purpose_classrooms_url, as: :json
    assert_response :success
  end

  test "should create purpose_classroom" do
    assert_difference('PurposeClassroom.count') do
      post purpose_classrooms_url, params: { purpose_classroom: { name: @purpose_classroom.name } }, as: :json
    end

    assert_response 201
  end

  test "should show purpose_classroom" do
    get purpose_classroom_url(@purpose_classroom), as: :json
    assert_response :success
  end

  test "should update purpose_classroom" do
    patch purpose_classroom_url(@purpose_classroom), params: { purpose_classroom: { name: @purpose_classroom.name } }, as: :json
    assert_response 200
  end

  test "should destroy purpose_classroom" do
    assert_difference('PurposeClassroom.count', -1) do
      delete purpose_classroom_url(@purpose_classroom), as: :json
    end

    assert_response 204
  end
end
