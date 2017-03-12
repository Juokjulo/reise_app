require 'test_helper'

class MaterialCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @material_category = material_categories(:one)
  end

  test "should get index" do
    get material_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_material_category_url
    assert_response :success
  end

  test "should create material_category" do
    assert_difference('MaterialCategory.count') do
      post material_categories_url, params: { material_category: { name: @material_category.name } }
    end

    assert_redirected_to material_category_url(MaterialCategory.last)
  end

  test "should show material_category" do
    get material_category_url(@material_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_material_category_url(@material_category)
    assert_response :success
  end

  test "should update material_category" do
    patch material_category_url(@material_category), params: { material_category: { name: @material_category.name } }
    assert_redirected_to material_category_url(@material_category)
  end

  test "should destroy material_category" do
    assert_difference('MaterialCategory.count', -1) do
      delete material_category_url(@material_category)
    end

    assert_redirected_to material_categories_url
  end
end
