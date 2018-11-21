class UnidadeMedida < ApplicationRecord
  validates_presence_of :nome, :sigla
  validates_length_of :nome, maximum: 20
  validates_length_of :sigla, maximum: 10

  def has_pedido?
    pedido = Pedido.where(:unidade_medida_id => self.id)
    not pedido.empty?
  end
end
