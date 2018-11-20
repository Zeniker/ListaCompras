class TipoProdutosController < ApplicationController
  TITULO_LISTAGEM='Tipos de Produto Cadastrados'
  TITULO_VISUALIZACAO='Visualização de Tipo de Produto'
  TITULO_INCLUSAO='Inclusão de Tipo de Produto'
  TITULO_ALTERACAO='Alteração de Tipo de Produto'
  TITULO_EXCLUSAO='Exclusão de Tipo de Produto'

  before_action :require_authentication
  before_action :set_tipo_produto, only: [:show, :edit, :update, :confirm_delete, :destroy]
  before_action :check_dependencies, only: [:confirm_delete, :destroy]


  # GET /tipo_produtos
  # GET /tipo_produtos.json
  def index
    define_titulo_pagina TITULO_LISTAGEM
    @tipo_produtos = TipoProduto.all.page(params[:page])
  end

  # GET /tipo_produtos/1
  # GET /tipo_produtos/1.json
  def show
    define_titulo_pagina TITULO_VISUALIZACAO
  end

  # GET /tipo_produtos/new
  def new
    define_titulo_pagina TITULO_INCLUSAO
    @tipo_produto = TipoProduto.new
  end

  # POST /tipo_produtos
  # POST /tipo_produtos.json
  def create
    @tipo_produto = TipoProduto.new(tipo_produto_params)

    respond_to do |format|
      if @tipo_produto.save
        format.html { redirect_to @tipo_produto, notice: 'Tipo de Produto criado com sucesso.' }
        format.json { render :show, status: :created, location: @tipo_produto }
      else
        define_titulo_pagina TITULO_INCLUSAO
        format.html { render :new }
        format.json { render json: @tipo_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tipo_produtos/1/edit
  def edit
    define_titulo_pagina TITULO_ALTERACAO
  end

  # PATCH/PUT /tipo_produtos/1
  # PATCH/PUT /tipo_produtos/1.json
  def update
    respond_to do |format|
      if @tipo_produto.update(tipo_produto_params)
        format.html { redirect_to @tipo_produto, notice: 'Tipo de Produto alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @tipo_produto }
      else
        define_titulo_pagina TITULO_ALTERACAO
        format.html { render :edit }
        format.json { render json: @tipo_produto.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /tipo_produtos/1
  def confirm_delete
    define_titulo_pagina TITULO_EXCLUSAO
  end

  # DELETE /tipo_produtos/1
  # DELETE /tipo_produtos/1.json
  def destroy
    @tipo_produto.destroy
    respond_to do |format|
      format.html { redirect_to tipo_produtos_url, notice: 'Tipo de Produto excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_produto
      @tipo_produto = TipoProduto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_produto_params
      params.require(:tipo_produto).permit(:nome)
    end

    def check_dependencies
      if @tipo_produto.has_produto?
        redirect_with_dependencies tipo_produtos_path
      end
    end
end
