require 'test_helper'

class PedidosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pedido = pedidos(:one)
    @pedido_comprado = pedidos(:two)
    sign_in_as_default

    @params_pedido = {
        pedido: {
            produto_id: @pedido.produto_id,
            quantidade: @pedido.quantidade,
            usuario_id: @pedido.usuario_id,
            unidade_medida_id: @pedido.unidade_medida_id
        }
    }
  end

  test "should get index" do
    get pedidos_url
    assert_response :success
  end

  test "should get new" do
    get new_pedido_url
    assert_response :success
  end

  test "should create pedido" do
    assert_difference('Pedido.count') do
      post pedidos_url, params: @params_pedido
    end

    assert_redirected_to pedido_url(Pedido.last)
  end

  test "should show pedido" do
    get pedido_url(@pedido)
    assert_response :success
  end

  test "should get edit" do
    get edit_pedido_url(@pedido)
    assert_response :success
  end

  test "should update pedido" do
    patch pedido_url(@pedido), params: @params_pedido
    assert_redirected_to pedido_url(@pedido)
  end

  test "should get confirm_delete" do
    get confirm_delete_pedido_url(@pedido)
    assert_response :success
  end

  test "should not get confirm_delete" do
    get confirm_delete_pedido_url(@pedido_comprado)
    assert_redirected_to pedidos_url
  end

  test "should destroy pedido" do
    assert_difference('Pedido.count', -1) do
      delete pedido_url(@pedido)
    end

    assert_redirected_to pedidos_url
  end

  test "should not destroy pedido" do
    assert_no_difference('Pedido.count', -1) do
      delete pedido_url(@pedido_comprado)
    end

    assert_redirected_to pedidos_url
  end
end
