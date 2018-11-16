class AddSiglaToUnidadeMedida < ActiveRecord::Migration[5.2]
  def change
    add_column :unidade_medidas, :sigla, :string
  end
end
