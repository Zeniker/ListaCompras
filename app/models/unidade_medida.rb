class UnidadeMedida < ApplicationRecord
  validates_presence_of :nome, :sigla

  def has_pedido?
    pedido = Pedido.where(:unidade_medida_id => self.id)
    not pedido.empty?
  end
end
