require 'test_helper'

class TimeBoxesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:time_boxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create time_box" do
    assert_difference('TimeBox.count') do
      post :create, :time_box => { }
    end

    assert_redirected_to time_box_path(assigns(:time_box))
  end

  test "should show time_box" do
    get :show, :id => time_boxes(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => time_boxes(:one).to_param
    assert_response :success
  end

  test "should update time_box" do
    put :update, :id => time_boxes(:one).to_param, :time_box => { }
    assert_redirected_to time_box_path(assigns(:time_box))
  end

  test "should destroy time_box" do
    assert_difference('TimeBox.count', -1) do
      delete :destroy, :id => time_boxes(:one).to_param
    end

    assert_redirected_to time_boxes_path
  end
end
