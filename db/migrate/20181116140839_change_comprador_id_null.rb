class ChangeCompradorIdNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :pedidos, :comprador_id, true
  end
end
