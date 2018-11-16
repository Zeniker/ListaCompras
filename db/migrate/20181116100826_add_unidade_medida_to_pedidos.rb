class AddUnidadeMedidaToPedidos < ActiveRecord::Migration[5.2]
  def change
    add_reference :pedidos, :unidade_medida, foreign_key: true
  end
end
