class Produto < ApplicationRecord
  validates_presence_of :nome, :tipo
  validates_length_of :nome, maximum: 100, allow_blank: false

  def concat_nome_tipo
    "#{nome} - #{tipo}"
  end

  def has_pedido?
    pedidos = Pedido.where(:produto_id => self.id)
    not pedidos.empty?
  end
end
