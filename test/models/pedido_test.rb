require 'test_helper'

class PedidoTest < ActiveSupport::TestCase
  setup do
    @pedido = Pedido.new
    @pedido.id = 3
    @pedido.unidade_medida_id = 1
    @pedido.usuario_id = 1
    @pedido.produto_id = 1
    @pedido.quantidade = 50
  end

  test "validates presence of fields" do
    @pedido.quantidade = nil
    @pedido.unidade_medida_id = nil
    @pedido.produto_id = nil
    @pedido.usuario_id = nil
    assert_not @pedido.valid?
    assert_equal [:produto, :usuario, :unidade_medida, :produto_id, :usuario_id, :unidade_medida_id,
                  :quantidade], @pedido.errors.keys
  end

  test "validates pedido_comprado?" do
    assert_not @pedido.pedido_comprado?
    @pedido.comprador_id = 1
    assert @pedido.pedido_comprado?
  end

  test "validates comprar_pedidos" do
    pedidos_id = []
    pedidos_id.push(pedidos(:one).id)
    pedidos_id.push(pedidos(:three).id)
    Pedido.comprar_pedidos(pedidos_id, 1)

    pedido = Pedido.find(pedidos(:one).id)
    assert pedido.pedido_comprado?

    pedido = Pedido.find(pedidos(:three).id)
    assert pedido.pedido_comprado?
  end
end
