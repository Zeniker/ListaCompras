require 'test_helper'

class UnidadeMedidaTest < ActiveSupport::TestCase
  test "validates presence of nome" do
    unidade_medida = UnidadeMedida.new
    unidade_medida.sigla = "Kg"
    assert_not unidade_medida.save
  end

  test "validates presence of sigla" do
    unidade_medida = UnidadeMedida.new
    unidade_medida.nome = "Kilogramas"
    assert_not unidade_medida.save
  end

  test "should create" do
    unidade_medida = unidade_medidas(:one)
    assert unidade_medida.save
  end

  # test "should find" do
  #   unidade_medida = UnidadeMedida.find(1)
  #   print unidade_medida
  #   assert_not_empty unidade_medida
  # end

end
