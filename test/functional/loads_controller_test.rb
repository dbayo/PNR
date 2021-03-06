require 'test_helper'

class LoadsControllerTest < ActionController::TestCase
  setup do
    @load = loads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create load" do
    assert_difference('Load.count') do
      post :create, :load => @load.attributes
    end

    assert_redirected_to load_path(assigns(:load))
  end

  test "should show load" do
    get :show, :id => @load.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @load.to_param
    assert_response :success
  end

  test "should update load" do
    put :update, :id => @load.to_param, :load => @load.attributes
    assert_redirected_to load_path(assigns(:load))
  end

  test "should destroy load" do
    assert_difference('Load.count', -1) do
      delete :destroy, :id => @load.to_param
    end

    assert_redirected_to loads_path
  end
end
