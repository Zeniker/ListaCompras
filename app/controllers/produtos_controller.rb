class ProdutosController < ApplicationController
  def index
    define_titulo_pagina 'Lista de Produtos Cadastrados'
    @produtos = Produto.all
  end

  def show
    define_titulo_pagina 'Visualização de Produto'
    @produto = Produto.find params[:id]
  end

  def new
    define_titulo_pagina 'Criação de Produto'
    @produto = Produto.new
  end

  def create
    @produto = Produto.new produto_params
    if @produto.save
      redirect_to @produto,
                  notice: 'Produto criado com sucesso!'
    else
      render action: :new
    end
  end

  def edit
    define_titulo_pagina 'Alteração de Produto'
    @produto = Produto.find params[:id]
  end

  def update
    @produto = Produto.find params[:id]
    if @produto.update produto_params
      redirect_to @produto,
                  notice: 'Produto atualizado com sucesso'
    else
      render action: :edit
    end
  end

  def confirm_delete
    define_titulo_pagina 'Exclusão de Produto'
    @produto = Produto.find params[:id]
  end

  def destroy
    @produto = Produto.find params[:id]
    @produto.destroy

    redirect_to @produto,
                notice: 'Produto excluído com sucesso'
  end

  private

  def produto_params
    params.require(:produto).permit(:nome, :tipo)
  end
end