require 'test_helper'

class SubnetsControllerTest < ActionController::TestCase
  setup do
    @subnet = subnets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subnets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subnet" do
    assert_difference('Subnet.count') do
      post :create, subnet: { description: @subnet.description, subnet_addr: @subnet.subnet_addr }
    end

    assert_redirected_to subnet_path(assigns(:subnet))
  end

  test "should show subnet" do
    get :show, id: @subnet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subnet
    assert_response :success
  end

  test "should update subnet" do
    patch :update, id: @subnet, subnet: { description: @subnet.description, subnet_addr: @subnet.subnet_addr }
    assert_redirected_to subnet_path(assigns(:subnet))
  end

  test "should destroy subnet" do
    assert_difference('Subnet.count', -1) do
      delete :destroy, id: @subnet
    end

    assert_redirected_to subnets_path
  end
end
