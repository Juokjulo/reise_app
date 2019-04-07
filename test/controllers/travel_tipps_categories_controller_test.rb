require 'test_helper'

class TravelTippsCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_tipps_category = travel_tipps_categories(:one)
  end

  test "should get index" do
    get travel_tipps_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_tipps_category_url
    assert_response :success
  end

  test "should create travel_tipps_category" do
    assert_difference('TravelTippsCategory.count') do
      post travel_tipps_categories_url, params: { travel_tipps_category: { name: @travel_tipps_category.name } }
    end

    assert_redirected_to travel_tipps_category_url(TravelTippsCategory.last)
  end

  test "should show travel_tipps_category" do
    get travel_tipps_category_url(@travel_tipps_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_tipps_category_url(@travel_tipps_category)
    assert_response :success
  end

  test "should update travel_tipps_category" do
    patch travel_tipps_category_url(@travel_tipps_category), params: { travel_tipps_category: { name: @travel_tipps_category.name } }
    assert_redirected_to travel_tipps_category_url(@travel_tipps_category)
  end

  test "should destroy travel_tipps_category" do
    assert_difference('TravelTippsCategory.count', -1) do
      delete travel_tipps_category_url(@travel_tipps_category)
    end

    assert_redirected_to travel_tipps_categories_url
  end
end
