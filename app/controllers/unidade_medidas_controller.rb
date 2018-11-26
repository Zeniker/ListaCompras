class UnidadeMedidasController < ApplicationController
  TITULO_LISTAGEM='Unidades de Medida Cadastradas'
  TITULO_VISUALIZACAO='Visualização de Unidade de Medida'
  TITULO_INCLUSAO='Inclusão de Unidade de Medida'
  TITULO_ALTERACAO='Alteração de Unidade de Medida'
  TITULO_EXCLUSAO='Exclusão de Unidade de Medida'

  before_action :require_authentication
  before_action :set_unidade_medida, only: [:show, :edit, :update, :destroy, :confirm_delete]
  before_action :check_dependencies, only: [:confirm_delete, :destroy]

  # GET /unidade_medidas
  # GET /unidade_medidas.json
  def index
    define_titulo_pagina TITULO_LISTAGEM
    @unidade_medidas = UnidadeMedida.all.page(params[:page])
  end

  # GET /unidade_medidas/1
  # GET /unidade_medidas/1.json
  def show
    define_titulo_pagina TITULO_VISUALIZACAO
  end

  # GET /unidade_medidas/new
  def new
    define_titulo_pagina TITULO_INCLUSAO
    @unidade_medida = UnidadeMedida.new
  end

  # GET /unidade_medidas/1/edit
  def edit
    define_titulo_pagina TITULO_ALTERACAO
  end

  # POST /unidade_medidas
  # POST /unidade_medidas.json
  def create
    @unidade_medida = UnidadeMedida.new(unidade_medida_params)

    respond_to do |format|
      if @unidade_medida.save
        format.html { redirect_to @unidade_medida, notice: 'Unidade de medida criada com sucesso.' }
        format.json { render :show, status: :created, location: @unidade_medida }
      else
        define_titulo_pagina TITULO_INCLUSAO
        format.html { render :new }
        format.json { render json: @unidade_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unidade_medidas/1
  # PATCH/PUT /unidade_medidas/1.json
  def update
    respond_to do |format|
      if @unidade_medida.update(unidade_medida_params)
        format.html { redirect_to @unidade_medida, notice: 'Unidade de medida alterada com sucesso.' }
        format.json { render :show, status: :ok, location: @unidade_medida }
      else
        define_titulo_pagina TITULO_ALTERACAO
        format.html { render :edit }
        format.json { render json: @unidade_medida.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm_delete
    define_titulo_pagina TITULO_EXCLUSAO
  end

  # DELETE /unidade_medidas/1
  # DELETE /unidade_medidas/1.json
  def destroy
    @unidade_medida.destroy
    respond_to do |format|
      format.html { redirect_to unidade_medidas_url, notice: 'Unidade de medida excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unidade_medida
      @unidade_medida = UnidadeMedida.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unidade_medida_params
      params.require(:unidade_medida).permit(:nome, :sigla)
    end

    def check_dependencies
      if @unidade_medida.has_pedido?
        redirect_with_dependencies unidade_medidas_path
      end
    end
end
