class ProdutosController < ApplicationController
  Titulo_listagem='Produtos Cadastrados'
  Titulo_visualizacao='Visualização de Produto'
  Titulo_inclusao='Inclusão de Produto'
  Titulo_alteracao='Alteração de Produto'
  Titulo_exclusao='Exclusão de Produto'

  def index
    define_titulo_pagina Titulo_listagem
    @produtos = Produto.all
  end

  def show
    define_titulo_pagina Titulo_visualizacao
    @produto = Produto.find params[:id]
  end

  def new
    define_titulo_pagina Titulo_inclusao
    @produto = Produto.new
  end

  def create
    @produto = Produto.new produto_params
    if @produto.save
      redirect_to produtos_path,
                  notice: 'Produto criado com sucesso!'
    else
      define_titulo_pagina Titulo_inclusao
      render action: :new
    end
  end

  def edit
    define_titulo_pagina Titulo_alteracao
    @produto = Produto.find params[:id]
  end

  def update
    @produto = Produto.find params[:id]
    if @produto.update produto_params
      redirect_to produtos_path,
                  notice: 'Produto atualizado com sucesso'
    else
      define_titulo_pagina Titulo_alteracao
      render action: :edit
    end
  end

  def confirm_delete
    define_titulo_pagina Titulo_exclusao
    @produto = Produto.find params[:id]
  end

  def destroy
    @produto = Produto.find params[:id]
    @produto.destroy

    redirect_to produtos_path,
                notice: 'Produto excluído com sucesso'
  end

  private

  def produto_params
    params.require(:produto).permit(:nome, :tipo)
  end
end