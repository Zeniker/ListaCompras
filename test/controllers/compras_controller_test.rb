require 'test_helper'

class ComprasControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_as_default
  end

  test "should get pedidos_abertos" do
    get root_path
    assert_response :success
  end

  test "should get pedidos_fechados" do
    get pedidos_fechados_url
    assert_response :success
  end

  test "should create compra" do
    params = {
        pedidos: [
            pedidos(:one).id,
            pedidos(:three).id
        ]
    }
    post compras_url, params: params

    params[:pedidos].each do |pedido_id|
      assert Pedido.find(pedido_id).pedido_comprado?
    end

    assert_redirected_to root_url
  end


end