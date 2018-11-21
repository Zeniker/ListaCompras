require 'test_helper'

class UnidadeMedidasControllerTest < ActionDispatch::IntegrationTest
  include UnidadeMedidaHelper

  setup do
    @unidade_medida = unidade_medidas(:one)
    @nova_unidade_medida = create_new_unidade_medida
    sign_in_as_default
  end

  test "should get index" do
    get unidade_medidas_url
    assert_response :success
  end

  test "should get new" do
    get new_unidade_medida_url
    assert_response :success
  end

  test "should create unidade_medida" do
    assert_difference('UnidadeMedida.count') do
      post unidade_medidas_url, params: { unidade_medida: { nome: @unidade_medida.nome, sigla: @unidade_medida.sigla } }
    end

    assert_redirected_to unidade_medida_url(UnidadeMedida.last)
  end

  test "should show unidade_medida" do
    get unidade_medida_url(@unidade_medida)
    assert_response :success
  end

  test "should get edit" do
    get edit_unidade_medida_url(@unidade_medida)
    assert_response :success
  end

  test "should update unidade_medida" do
    patch unidade_medida_url(@unidade_medida), params: { unidade_medida: { nome: @unidade_medida.nome, sigla: @unidade_medida.sigla } }
    assert_redirected_to unidade_medida_url(@unidade_medida)
  end

  test "should get confirm_delete" do
    get confirm_delete_unidade_medida_url(@nova_unidade_medida)
    assert_response :success
  end

  test "should not get confirm_delete" do
    get confirm_delete_unidade_medida_url(@unidade_medida)
    assert_redirected_to unidade_medidas_url
  end

  test "should destroy unidade_medida" do
    assert_difference('UnidadeMedida.count', -1) do
      delete unidade_medida_url(@nova_unidade_medida)
    end

    assert_redirected_to unidade_medidas_url
  end

  test "should not destroy unidade_medida" do
    assert_no_difference('UnidadeMedida.count', -1) do
      delete unidade_medida_url(@unidade_medida)
    end

    assert_redirected_to unidade_medidas_url
  end
end
