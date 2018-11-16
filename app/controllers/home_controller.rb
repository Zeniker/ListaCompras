class HomeController < ApplicationController
  before_action :require_authentication

  def index
    define_titulo_pagina 'Pedidos em Aberto'
    @pedidos = Pedido.get_abertos
    @compra = Compra.new
  end
end