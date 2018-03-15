require 'test_helper'

class HeadBuildingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @head_building = head_buildings(:one)
  end

  test "should get index" do
    get head_buildings_url, as: :json
    assert_response :success
  end

  test "should create head_building" do
    assert_difference('HeadBuilding.count') do
      post head_buildings_url, params: { head_building: { cc: @head_building.cc, email: @head_building.email, first_name: @head_building.first_name, last_name: @head_building.last_name } }, as: :json
    end

    assert_response 201
  end

  test "should show head_building" do
    get head_building_url(@head_building), as: :json
    assert_response :success
  end

  test "should update head_building" do
    patch head_building_url(@head_building), params: { head_building: { cc: @head_building.cc, email: @head_building.email, first_name: @head_building.first_name, last_name: @head_building.last_name } }, as: :json
    assert_response 200
  end

  test "should destroy head_building" do
    assert_difference('HeadBuilding.count', -1) do
      delete head_building_url(@head_building), as: :json
    end

    assert_response 204
  end
end
