require 'test_helper'
require 'pp'

class PedidoTest < ActiveSupport::TestCase
  setup do
    @pedido = Pedido.new
    @pedido.unidade_medida_id = 1
    @pedido.usuario_id = 1
    @pedido.produto_id = 1
    @pedido.quantidade = 50.0
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

  test "should save" do
    assert @pedido.save, @pedido.errors.full_messages.inspect
  end

  test "validates compra_pedido" do
    @pedido.save
    assert @pedido.compra_pedido(1), @pedido.errors.full_messages.inspect
  end

  test "validates pedido_comprado?" do
    assert_not @pedido.pedido_comprado?
    @pedido.compra_pedido 1
    assert @pedido.pedido_comprado?
  end

  test "validates comprar_pedidos" do
    pedidos_id = []
    pedidos_id << (pedidos(:one).id)
    pedidos_id << (pedidos(:three).id)
    Pedido.comprar_pedidos(pedidos_id, 1)

    pedidos_id.each do |id|
      assert Pedido.find(id).pedido_comprado?
    end
  end
end
