class ComprasController < ApplicationController
  before_action :require_authentication

  def pedidos_abertos
    define_titulo_pagina 'Pedidos em Aberto'
    @pedidos = Pedido.get_abertos
    @compra = Compra.new
  end

  def pedidos_fechados
    define_titulo_pagina 'Histórico de pedidos'
    @pedidos = Pedido.get_comprados.page(params[:page])
  end

  def create
    Pedido.comprar_pedidos params[:pedidos], current_user.id
    redirect_to root_path, notice: 'Compra realizada com sucesso'
  end
end