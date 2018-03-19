require 'test_helper'

class MealControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meal_index_url
    assert_response :success
  end

  test "should get new" do
    get meal_new_url
    assert_response :success
  end

  test "should get create" do
    get meal_create_url
    assert_response :success
  end

  test "should get show" do
    get meal_show_url
    assert_response :success
  end

  test "should get edit" do
    get meal_edit_url
    assert_response :success
  end

  test "should get update" do
    get meal_update_url
    assert_response :success
  end

  test "should get destroy" do
    get meal_destroy_url
    assert_response :success
  end

end
