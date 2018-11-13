class AddIndexToUsuario < ActiveRecord::Migration[5.2]
  def change
    add_index :usuarios, :login, unique: true
  end
end
