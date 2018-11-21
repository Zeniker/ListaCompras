require 'test_helper'

class TipoProdutoTest < ActiveSupport::TestCase
  setup do
    @tipo_produto = TipoProduto.new
    @tipo_produto.nome = "Comida"
  end

  test "validates presence of fields" do
    @tipo_produto.nome = nil
    assert_not @tipo_produto.valid?
    assert_equal [:nome], @tipo_produto.errors.keys
  end

  test "validates length of nome" do
    @tipo_produto.nome = "a" * 26
    assert_not @tipo_produto.valid?
    assert_equal [:nome], @tipo_produto.errors.keys
    @tipo_produto.nome = "a" * 25
    assert @tipo_produto.valid?
  end

  test "should create" do
    assert @tipo_produto.save
  end
end
