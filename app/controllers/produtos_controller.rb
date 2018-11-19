class ProdutosController < ApplicationController
  TITULO_LISTAGEM='Produtos Cadastrados'
  TITULO_VISUALIZACAO='Visualização de Produto'
  TITULO_INCLUSAO='Inclusão de Produto'
  TITULO_ALTERACAO='Alteração de Produto'
  TITULO_EXCLUSAO='Exclusão de Produto'

  before_action :require_authentication

  def index
    define_titulo_pagina TITULO_LISTAGEM
    @produtos = Produto.all.page(params[:page])
  end

  def show
    define_titulo_pagina TITULO_VISUALIZACAO
    @produto = Produto.find params[:id]
  end

  def new
    define_titulo_pagina TITULO_INCLUSAO
    @produto = Produto.new
  end

  def create
    @produto = Produto.new produto_params
    if @produto.save
      redirect_to produtos_path,
                  notice: 'Produto criado com sucesso!'
    else
      define_titulo_pagina TITULO_INCLUSAO
      render action: :new
    end
  end

  def edit
    define_titulo_pagina TITULO_ALTERACAO
    @produto = Produto.find params[:id]
  end

  def update
    @produto = Produto.find params[:id]
    if @produto.update produto_params
      redirect_to produtos_path,
                  notice: 'Produto atualizado com sucesso'
    else
      define_titulo_pagina TITULO_ALTERACAO
      render action: :edit
    end
  end

  def confirm_delete
    define_titulo_pagina TITULO_EXCLUSAO
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