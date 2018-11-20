class Produto < ApplicationRecord
  belongs_to :tipo_produto

  validates_presence_of :nome, :tipo_produto_id
  validates_length_of :nome, maximum: 100, allow_blank: false

  def has_pedido?
    pedidos = Pedido.where(:produto_id => self.id)
    not pedidos.empty?
  end
end
