class Pedido < ApplicationRecord
  belongs_to :produto
  belongs_to :usuario
  belongs_to :unidade_medida
  belongs_to :comprador, class_name: "Usuario", optional: true

  validates_presence_of :produto_id, :usuario_id, :unidade_medida_id, :quantidade

  def pedido_comprado?
    not self.comprador.blank?
  end

  def self.get_abertos
    Pedido.where(comprador_id: nil)
        .order(:created_at)
  end

  def self.get_comprados
    Pedido.where.not(comprador_id: nil)
        .order(updated_at: :desc)
  end

  def self.comprar_pedido(pedidos, usuario_id)
    pedidos.each do |pedido|
      pedido = Pedido.find(pedido)
      unless pedido.pedido_comprado?
        pedido.comprador_id = usuario_id
        pedido.data_compra = Time.now
        pedido.save
      end
    end
  end

  def self.from_user(usuario_id)
    Pedido.where(usuario_id: usuario_id)
        .order(created_at: :desc)
  end
end
