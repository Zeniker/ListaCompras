class AddDiscardedAtToUsuarios < ActiveRecord::Migration[5.2]
  def change
    add_column :usuarios, :discarded_at, :datetime
    add_index :usuarios, :discarded_at
  end
end
