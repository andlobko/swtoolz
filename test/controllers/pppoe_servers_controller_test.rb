require 'test_helper'

class PppoeServersControllerTest < ActionController::TestCase
  setup do
    @pppoe_server = pppoe_servers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pppoe_servers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pppoe_server" do
    assert_difference('PppoeServer.count') do
      post :create, pppoe_server: { address: @pppoe_server.address, description: @pppoe_server.description, name: @pppoe_server.name, snmp_password: @pppoe_server.snmp_password, snmp_user: @pppoe_server.snmp_user, telnet_password: @pppoe_server.telnet_password }
    end

    assert_redirected_to pppoe_server_path(assigns(:pppoe_server))
  end

  test "should show pppoe_server" do
    get :show, id: @pppoe_server
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pppoe_server
    assert_response :success
  end

  test "should update pppoe_server" do
    patch :update, id: @pppoe_server, pppoe_server: { address: @pppoe_server.address, description: @pppoe_server.description, name: @pppoe_server.name, snmp_password: @pppoe_server.snmp_password, snmp_user: @pppoe_server.snmp_user, telnet_password: @pppoe_server.telnet_password }
    assert_redirected_to pppoe_server_path(assigns(:pppoe_server))
  end

  test "should destroy pppoe_server" do
    assert_difference('PppoeServer.count', -1) do
      delete :destroy, id: @pppoe_server
    end

    assert_redirected_to pppoe_servers_path
  end
end
