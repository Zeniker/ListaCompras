class TipoProduto < ApplicationRecord
  validates_presence_of :nome
  validates_length_of :nome, maximum: 25

  def has_produto?
    produtos = Produto.where(:tipo_produto_id => self.id)
    not produtos.empty?
  end
end
