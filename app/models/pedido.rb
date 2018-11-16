class Pedido < ApplicationRecord
  belongs_to :produto
  belongs_to :usuario
  belongs_to :unidade_medida
  belongs_to :comprador, class_name: "Usuario", optional: true

  validates_presence_of :produto_id, :usuario_id, :unidade_medida_id, :quantidade

  def is_pedido_comprado
    not self.comprador.blank?
  end
end
