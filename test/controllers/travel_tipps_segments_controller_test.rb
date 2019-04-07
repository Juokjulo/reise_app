require 'test_helper'

class TravelTippsSegmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @travel_tipps_segment = travel_tipps_segments(:one)
  end

  test "should get index" do
    get travel_tipps_segments_url
    assert_response :success
  end

  test "should get new" do
    get new_travel_tipps_segment_url
    assert_response :success
  end

  test "should create travel_tipps_segment" do
    assert_difference('TravelTippsSegment.count') do
      post travel_tipps_segments_url, params: { travel_tipps_segment: { borderLeft: @travel_tipps_segment.borderLeft, borderRight: @travel_tipps_segment.borderRight, colorLeft: @travel_tipps_segment.colorLeft, colorRight: @travel_tipps_segment.colorRight, contentLeft: @travel_tipps_segment.contentLeft, contentRight: @travel_tipps_segment.contentRight, public: @travel_tipps_segment.public, titleLeft: @travel_tipps_segment.titleLeft, titleRight: @travel_tipps_segment.titleRight } }
    end

    assert_redirected_to travel_tipps_segment_url(TravelTippsSegment.last)
  end

  test "should show travel_tipps_segment" do
    get travel_tipps_segment_url(@travel_tipps_segment)
    assert_response :success
  end

  test "should get edit" do
    get edit_travel_tipps_segment_url(@travel_tipps_segment)
    assert_response :success
  end

  test "should update travel_tipps_segment" do
    patch travel_tipps_segment_url(@travel_tipps_segment), params: { travel_tipps_segment: { borderLeft: @travel_tipps_segment.borderLeft, borderRight: @travel_tipps_segment.borderRight, colorLeft: @travel_tipps_segment.colorLeft, colorRight: @travel_tipps_segment.colorRight, contentLeft: @travel_tipps_segment.contentLeft, contentRight: @travel_tipps_segment.contentRight, public: @travel_tipps_segment.public, titleLeft: @travel_tipps_segment.titleLeft, titleRight: @travel_tipps_segment.titleRight } }
    assert_redirected_to travel_tipps_segment_url(@travel_tipps_segment)
  end

  test "should destroy travel_tipps_segment" do
    assert_difference('TravelTippsSegment.count', -1) do
      delete travel_tipps_segment_url(@travel_tipps_segment)
    end

    assert_redirected_to travel_tipps_segments_url
  end
end
