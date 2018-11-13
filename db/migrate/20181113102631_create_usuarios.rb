class CreateUsuarios < ActiveRecord::Migration[5.2]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :password
      t.string :password_digest

      t.timestamps
    end
  end
end
