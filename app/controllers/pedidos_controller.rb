class PedidosController < ApplicationController
  TITULO_LISTAGEM='Pedidos Cadastrados'
  TITULO_VISUALIZACAO='Visualização de Pedido'
  TITULO_INCLUSAO='Inclusão de Pedido'
  TITULO_ALTERACAO='Alteração de Pedido'
  TITULO_EXCLUSAO='Exclusão de Pedido'

  before_action :set_pedido, only: [:show, :edit, :update, :confirm_delete, :destroy]
  before_action :require_authentication
  before_action :get_dependencies, only: [:new, :create, :edit, :update, :confirm_delete]
  before_action :block_changes_comprado, only: [:edit, :confirm_delete]

  # GET /pedidos
  # GET /pedidos.json
  def index
    define_titulo_pagina TITULO_LISTAGEM
    @pedidos = Pedido.all
  end

  # GET /pedidos/1
  # GET /pedidos/1.json
  def show
    define_titulo_pagina TITULO_VISUALIZACAO
  end

  # GET /pedidos/new
  def new
    define_titulo_pagina TITULO_INCLUSAO
    @pedido = Pedido.new
  end

  # POST /pedidos
  # POST /pedidos.json
  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.usuario = current_user

    respond_to do |format|
      if @pedido.save
        format.html { redirect_to @pedido, notice: 'Pedido cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @pedido }
      else
        define_titulo_pagina TITULO_INCLUSAO
        format.html { render :new }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /pedidos/1/edit
  def edit
    define_titulo_pagina TITULO_ALTERACAO
  end

  # PATCH/PUT /pedidos/1
  # PATCH/PUT /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to @pedido, notice: 'Pedido alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @pedido }
      else
        define_titulo_pagina TITULO_ALTERACAO
        format.html { render :edit }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_delete
    define_titulo_pagina TITULO_EXCLUSAO
  end

  # DELETE /pedidos/1
  # DELETE /pedidos/1.json
  def destroy
    @pedido.destroy
    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: 'Pedido excluído.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pedido_params
      params.require(:pedido).permit(:produto_id, :usuario_id, :quantidade, :unidade_medida_id)
    end

    def get_dependencies
      @produtos = Produto.all
      @unidade_medidas = UnidadeMedida.all
    end

    def block_changes_comprado
      if @pedido.is_pedido_comprado
        redirect_to pedidos_path, notice: 'Este pedido já foi comprado e não pode ser alterado/excluído'
      end
    end
end
