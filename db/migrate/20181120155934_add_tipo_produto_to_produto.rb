class AddTipoProdutoToProduto < ActiveRecord::Migration[5.2]
  def change
    add_reference :produtos, :tipo_produto, foreign_key: true
  end
end
