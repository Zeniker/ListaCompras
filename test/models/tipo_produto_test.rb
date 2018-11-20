require 'test_helper'

class TipoProdutoTest < ActiveSupport::TestCase
  test "validates presence of nome" do
    tipo_produto = TipoProduto.new
    assert_not tipo_produto.save
  end

  test "should create" do
    tipo_produto = tipo_produtos(:one)
    assert tipo_produto.save
  end
end
