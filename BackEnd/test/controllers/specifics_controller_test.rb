require 'test_helper'

class SpecificsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @specific = specifics(:one)
  end

  test "should get index" do
    get specifics_url, as: :json
    assert_response :success
  end

  test "should create specific" do
    assert_difference('Specific.count') do
      post specifics_url, params: { specific: { begin_at: @specific.begin_at, date: @specific.date, end_at: @specific.end_at } }, as: :json
    end

    assert_response 201
  end

  test "should show specific" do
    get specific_url(@specific), as: :json
    assert_response :success
  end

  test "should update specific" do
    patch specific_url(@specific), params: { specific: { begin_at: @specific.begin_at, date: @specific.date, end_at: @specific.end_at } }, as: :json
    assert_response 200
  end

  test "should destroy specific" do
    assert_difference('Specific.count', -1) do
      delete specific_url(@specific), as: :json
    end

    assert_response 204
  end
end
