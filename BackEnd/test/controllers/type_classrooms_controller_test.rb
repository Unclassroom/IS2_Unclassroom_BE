require 'test_helper'

class TypeClassroomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_classroom = type_classrooms(:one)
  end

  test "should get index" do
    get type_classrooms_url, as: :json
    assert_response :success
  end

  test "should create type_classroom" do
    assert_difference('TypeClassroom.count') do
      post type_classrooms_url, params: { type_classroom: { name: @type_classroom.name } }, as: :json
    end

    assert_response 201
  end

  test "should show type_classroom" do
    get type_classroom_url(@type_classroom), as: :json
    assert_response :success
  end

  test "should update type_classroom" do
    patch type_classroom_url(@type_classroom), params: { type_classroom: { name: @type_classroom.name } }, as: :json
    assert_response 200
  end

  test "should destroy type_classroom" do
    assert_difference('TypeClassroom.count', -1) do
      delete type_classroom_url(@type_classroom), as: :json
    end

    assert_response 204
  end
end
