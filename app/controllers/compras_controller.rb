class ComprasController < ApplicationController

  def index
    define_titulo_pagina 'Histórico de pedidos'
    @pedidos = Pedido.get_comprados
  end

  def create
    Pedido.comprar_pedido params[:pedidos], current_user.id
    redirect_to root_path, notice: 'Compra realizada com sucesso'
  end
end