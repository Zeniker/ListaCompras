ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

module SessionHelper
  def sign_in_as(usuario)
    post user_sessions_url, params: {
        user_session: {
            login: usuario.login,
            password: usuario.password
        }
    }
  end

  def sign_in_as_default
    usuario = usuarios(:one)
    usuario.password = "123321"
    sign_in_as usuario
  end
end

module TipoProdutoHelper
  def create_new_tipo_produto
    tipo_produto = TipoProduto.new
    tipo_produto.nome = "Enlatados"
    tipo_produto.save
    TipoProduto.last
  end
end

module ProdutoHelper
  def create_new_produto(tipo_produto_id = nil)
    produto = Produto.new
    produto.nome = "Sardinha"
    if tipo_produto_id.nil?
      produto.tipo_produto_id = create_new_tipo_produto.id
    else
      produto.tipo_produto_id = tipo_produto_id
    end
    produto.save

    Produto.last
  end
end

module UnidadeMedidaHelper
  def create_new_unidade_medida
    unidade_medida = UnidadeMedida.new
    unidade_medida.nome = "Pacote"
    unidade_medida.sigla = "Pct"
    unidade_medida.save

    UnidadeMedida.last
  end
end

class ActionDispatch::IntegrationTest
  include SessionHelper
end
