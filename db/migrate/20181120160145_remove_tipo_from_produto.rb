class RemoveTipoFromProduto < ActiveRecord::Migration[5.2]
  def change
    remove_column :produtos, :tipo, :string
  end
end
