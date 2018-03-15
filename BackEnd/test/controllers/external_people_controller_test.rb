require 'test_helper'

class ExternalPeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @external_person = external_people(:one)
  end

  test "should get index" do
    get external_people_url, as: :json
    assert_response :success
  end

  test "should create external_person" do
    assert_difference('ExternalPerson.count') do
      post external_people_url, params: { external_person: { cc: @external_person.cc, email: @external_person.email, first_name: @external_person.first_name, last_name: @external_person.last_name } }, as: :json
    end

    assert_response 201
  end

  test "should show external_person" do
    get external_person_url(@external_person), as: :json
    assert_response :success
  end

  test "should update external_person" do
    patch external_person_url(@external_person), params: { external_person: { cc: @external_person.cc, email: @external_person.email, first_name: @external_person.first_name, last_name: @external_person.last_name } }, as: :json
    assert_response 200
  end

  test "should destroy external_person" do
    assert_difference('ExternalPerson.count', -1) do
      delete external_person_url(@external_person), as: :json
    end

    assert_response 204
  end
end
