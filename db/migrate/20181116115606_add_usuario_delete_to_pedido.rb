class AddUsuarioDeleteToPedido < ActiveRecord::Migration[5.2]
  def change
    add_reference :pedidos, :comprador, index: true
    add_foreign_key :pedidos, :usuarios, column: :comprador_id
  end
end
