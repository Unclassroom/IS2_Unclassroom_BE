require 'test_helper'

class DepartmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @department = departments(:one)
  end

  test "should get index" do
    get departments_url, as: :json
    assert_response :success
  end

  test "should create department" do
    assert_difference('Department.count') do
      post departments_url, params: { department: { faculty_id: @department.faculty_id, name: @department.name, teacher_id: @department.teacher_id } }, as: :json
    end

    assert_response 201
  end

  test "should show department" do
    get department_url(@department), as: :json
    assert_response :success
  end

  test "should update department" do
    patch department_url(@department), params: { department: { faculty_id: @department.faculty_id, name: @department.name, teacher_id: @department.teacher_id } }, as: :json
    assert_response 200
  end

  test "should destroy department" do
    assert_difference('Department.count', -1) do
      delete department_url(@department), as: :json
    end

    assert_response 204
  end
end
