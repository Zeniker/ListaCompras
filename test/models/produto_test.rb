require 'test_helper'

class ProdutoTest < ActiveSupport::TestCase
  setup do
    @produto = Produto.new
    @produto.tipo_produto_id = 1
    @produto.nome = "Massa Penne"
  end

  test "validates presence of fields" do
    @produto.tipo_produto_id = nil
    @produto.nome = nil
    assert_not @produto.valid?
    assert_equal [:tipo_produto, :nome, :tipo_produto_id], @produto.errors.keys
  end

  test "validates length of nome" do
    @produto.nome = "a" * 101
    assert_not @produto.valid?
    assert_equal [:nome], @produto.errors.keys
    @produto.nome = "a" * 100
    assert @produto.valid?
  end

  test "validates has_pedido" do
    produto = produtos(:one)
    assert produto.has_pedido?
  end

  #   Mover para integração TALVEZ
  test "should save" do
    assert @produto.save
  end
end
