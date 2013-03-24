require 'test_helper'

class SplashAdsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:splash_ads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create splash_ad" do
    assert_difference('SplashAd.count') do
      post :create, :splash_ad => { }
    end

    assert_redirected_to splash_ad_path(assigns(:splash_ad))
  end

  test "should show splash_ad" do
    get :show, :id => splash_ads(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => splash_ads(:one).to_param
    assert_response :success
  end

  test "should update splash_ad" do
    put :update, :id => splash_ads(:one).to_param, :splash_ad => { }
    assert_redirected_to splash_ad_path(assigns(:splash_ad))
  end

  test "should destroy splash_ad" do
    assert_difference('SplashAd.count', -1) do
      delete :destroy, :id => splash_ads(:one).to_param
    end

    assert_redirected_to splash_ads_path
  end
end
