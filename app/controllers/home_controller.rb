class HomeController < ApplicationController
  before_action :require_authentication

  def index
    define_titulo_pagina 'Página principal'
  end
end