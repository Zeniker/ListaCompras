class RolifyCreateFuncaos < ActiveRecord::Migration[5.2]
  def change
    create_table(:funcaos) do |t|
      t.string :name
      t.references :resource, :polymorphic => true

      t.timestamps
    end

    create_table(:usuarios_funcaos, :id => false) do |t|
      t.references :usuario
      t.references :funcao
    end
    
    add_index(:funcaos, :name)
    add_index(:funcaos, [ :name, :resource_type, :resource_id ])
    add_index(:usuarios_funcaos, [ :usuario_id, :funcao_id ])
  end
end
