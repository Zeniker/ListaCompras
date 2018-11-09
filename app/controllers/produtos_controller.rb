class ProdutosController < ApplicationController
  def new
    @produto = Produto.new
  end
end