require 'test_helper'

class StorytextsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @storytext = storytexts(:one)
  end

  test "should get index" do
    get storytexts_url
    assert_response :success
  end

  test "should get new" do
    get new_storytext_url
    assert_response :success
  end

  test "should create storytext" do
    assert_difference('Storytext.count') do
      post storytexts_url, params: { storytext: { story: @storytext.story, title: @storytext.title } }
    end

    assert_redirected_to storytext_url(Storytext.last)
  end

  test "should show storytext" do
    get storytext_url(@storytext)
    assert_response :success
  end

  test "should get edit" do
    get edit_storytext_url(@storytext)
    assert_response :success
  end

  test "should update storytext" do
    patch storytext_url(@storytext), params: { storytext: { story: @storytext.story, title: @storytext.title } }
    assert_redirected_to storytext_url(@storytext)
  end

  test "should destroy storytext" do
    assert_difference('Storytext.count', -1) do
      delete storytext_url(@storytext)
    end

    assert_redirected_to storytexts_url
  end
end
