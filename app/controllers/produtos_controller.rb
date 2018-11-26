class ProdutosController < ApplicationController
  TITULO_LISTAGEM='Produtos Cadastrados'
  TITULO_VISUALIZACAO='Visualização de Produto'
  TITULO_INCLUSAO='Inclusão de Produto'
  TITULO_ALTERACAO='Alteração de Produto'
  TITULO_EXCLUSAO='Exclusão de Produto'

  before_action :require_authentication
  before_action :set_produto, only: [:show, :edit, :update, :confirm_delete, :destroy]
  before_action :check_dependencies, only: [:confirm_delete, :destroy]
  before_action :get_dependencies, only: [:new, :create, :edit, :update, :confirm_delete]

  def index
    define_titulo_pagina TITULO_LISTAGEM
    @produtos = Produto.all.page(params[:page])
  end

  def show
    define_titulo_pagina TITULO_VISUALIZACAO
  end

  def new
    define_titulo_pagina TITULO_INCLUSAO
    @produto = Produto.new
  end

  def create
    @produto = Produto.new produto_params
    if @produto.save
      redirect_to @produto,
                  notice: 'Produto criado com sucesso!'
    else
      define_titulo_pagina TITULO_INCLUSAO
      render action: :new
    end
  end

  def edit
    define_titulo_pagina TITULO_ALTERACAO
  end

  def update
    if @produto.update produto_params
      redirect_to @produto,
                  notice: 'Produto atualizado com sucesso'
    else
      define_titulo_pagina TITULO_ALTERACAO
      render :edit
    end
  end

  def confirm_delete
    define_titulo_pagina TITULO_EXCLUSAO
  end

  def destroy
      @produto.destroy

      redirect_to produtos_path,
                  notice: 'Produto excluído com sucesso'
  end

  private

    def set_produto
      @produto = Produto.find params[:id]
    end

    def produto_params
      params.require(:produto).permit(:nome, :tipo_produto_id)
    end

    def check_dependencies
      if @produto.has_pedido?
        redirect_with_dependencies produtos_path
      end
    end

    def get_dependencies
      @tipo_produtos = TipoProduto.all.order(:nome)
    end

end