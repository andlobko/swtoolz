require 'test_helper'

class DeviceTemplatesControllerTest < ActionController::TestCase
  setup do
    @device_template = device_templates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:device_templates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device_template" do
    assert_difference('DeviceTemplate.count') do
      post :create, device_template: { description: @device_template.description, name: @device_template.name }
    end

    assert_redirected_to device_template_path(assigns(:device_template))
  end

  test "should show device_template" do
    get :show, id: @device_template
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device_template
    assert_response :success
  end

  test "should update device_template" do
    patch :update, id: @device_template, device_template: { description: @device_template.description, name: @device_template.name }
    assert_redirected_to device_template_path(assigns(:device_template))
  end

  test "should destroy device_template" do
    assert_difference('DeviceTemplate.count', -1) do
      delete :destroy, id: @device_template
    end

    assert_redirected_to device_templates_path
  end
end
