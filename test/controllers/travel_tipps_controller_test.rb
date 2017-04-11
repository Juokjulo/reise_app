require 'test_helper'

class TravelTippsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_tipp = travel_tipps(:one)
  end

  test "should get index" do
    get travel_tipps_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_tipp_url
    assert_response :success
  end

  test "should create travel_tipp" do
    assert_difference('TravelTipp.count') do
      post travel_tipps_url, params: { travel_tipp: { description: @travel_tipp.description, name: @travel_tipp.name } }
    end

    assert_redirected_to travel_tipp_url(TravelTipp.last)
  end

  test "should show travel_tipp" do
    get travel_tipp_url(@travel_tipp)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_tipp_url(@travel_tipp)
    assert_response :success
  end

  test "should update travel_tipp" do
    patch travel_tipp_url(@travel_tipp), params: { travel_tipp: { description: @travel_tipp.description, name: @travel_tipp.name } }
    assert_redirected_to travel_tipp_url(@travel_tipp)
  end

  test "should destroy travel_tipp" do
    assert_difference('TravelTipp.count', -1) do
      delete travel_tipp_url(@travel_tipp)
    end

    assert_redirected_to travel_tipps_url
  end
end
