require 'test_helper'

class WeatherBoxesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weather_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weather_box" do
    assert_difference('WeatherBox.count') do
      post :create, :weather_box => { }
    end

    assert_redirected_to weather_box_path(assigns(:weather_box))
  end

  test "should show weather_box" do
    get :show, :id => weather_boxes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => weather_boxes(:one).to_param
    assert_response :success
  end

  test "should update weather_box" do
    put :update, :id => weather_boxes(:one).to_param, :weather_box => { }
    assert_redirected_to weather_box_path(assigns(:weather_box))
  end

  test "should destroy weather_box" do
    assert_difference('WeatherBox.count', -1) do
      delete :destroy, :id => weather_boxes(:one).to_param
    end

    assert_redirected_to weather_boxes_path
  end
end
