require 'test_helper'

class UsuariosControllerTest < ActionDispatch::IntegrationTest
  include UsuarioHelper

  setup do
    @usuario = usuarios(:one)
    @novo_usuario = create_new_usuario
    sign_in_as_default
  end

  test "should get index" do
    get usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_usuario_url
    assert_response :success
  end

  test "should create usuario" do
    assert_difference('Usuario.count') do
      post usuarios_url, params: create_params_usuario(@novo_usuario)
    end

    assert_redirected_to usuarios_url
  end

  test "should get edit" do
    get edit_usuario_url(@usuario)
    assert_response :success
  end

  test "should update usuario" do
    patch usuario_url(@usuario), params: create_params_usuario(@usuario)
    assert_redirected_to usuarios_url
  end

  test "should get confirm_delete" do
    @novo_usuario.save
    get confirm_delete_usuario_url(@novo_usuario)
    assert_response :success
  end

  test "should not get confirm_delete" do
    get confirm_delete_usuario_url(@usuario)
    assert_redirected_to usuarios_url

    sign_in_as usuarios(:two)
    get confirm_delete_usuario_url(@usuario)
    assert_redirected_to usuarios_url
  end

  test "should destroy usuario" do
    @novo_usuario.save
    delete usuario_url(@novo_usuario)
    assert Usuario.last.discarded?

    assert_redirected_to usuarios_url
  end

  test "should not destroy usuario" do
    delete usuario_url(@usuario)
    assert_not Usuario.find(@usuario.id).discarded?
    assert_redirected_to usuarios_url

    usuario = usuarios(:two)
    sign_in_as usuario
    delete usuario_url(@usuario)
    assert_not Usuario.find(@usuario.id).discarded?

    assert_redirected_to usuarios_url
  end
end