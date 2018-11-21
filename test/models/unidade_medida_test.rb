require 'test_helper'

class UnidadeMedidaTest < ActiveSupport::TestCase
  setup do
    @unidade_medida = UnidadeMedida.new
    @unidade_medida.nome = "Kilogramas"
    @unidade_medida.sigla = "Kg"
  end

  test "validates presence of fields" do
    @unidade_medida.nome = nil
    @unidade_medida.sigla = nil
    assert_not @unidade_medida.valid?
    assert_equal [:nome, :sigla], @unidade_medida.errors.keys
  end

  test "validates length of nome" do
    @unidade_medida.nome = "a" * 21
    assert_not @unidade_medida.valid?
    assert_equal [:nome], @unidade_medida.errors.keys
    @unidade_medida.nome = "a" * 20
    assert @unidade_medida.valid?
  end

  test "validates length of sigla" do
    @unidade_medida.sigla = "a" * 11
    assert_not @unidade_medida.valid?
    assert_equal [:sigla], @unidade_medida.errors.keys
    @unidade_medida.sigla = "a" * 10
    assert @unidade_medida.valid?
  end

  test "should have pedido" do
    unidade_medida = unidade_medidas(:one)
    assert unidade_medida.has_pedido?
  end

  test "should create" do
    @unidade_medida = unidade_medidas(:one)
    assert @unidade_medida.save
  end

end
