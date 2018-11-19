class AddDataCompraToPedido < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidos, :data_compra, :timestamp
  end
end
