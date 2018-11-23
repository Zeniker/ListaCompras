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
  def create_params_produto(produto)
    {
        produto: {
            nome: produto.nome,
            tipo_produto_id: produto.tipo_produto_id
        }
    }
  end

  def create_new_produto(tipo_produto_id = nil)
    if tipo_produto_id.nil?
      tipo_produto_id = tipo_produtos(:one).id
    end

    produto = Produto.new
    produto.nome = "Batata"
    produto.tipo_produto_id = tipo_produto_id
    produto
  end
end

module UnidadeMedidaHelper
  def save_new_unidade_medida
    create_new_unidade_medida.save

    UnidadeMedida.last
  end

  def create_new_unidade_medida
    unidade_medida = UnidadeMedida.new
    unidade_medida.nome = "Pacote"
    unidade_medida.sigla = "Pct"
    unidade_medida.save

    unidade_medida
  end
end

module UsuarioHelper

  def create_new_usuario
    usuario = Usuario.new
    usuario.nome = "Comum"
    usuario.login = "comum"
    usuario.password = "asdfgh"
    usuario.password_confirmation = "asdfgh"

    usuario
  end

  def save_new_usuario
    create_new_usuario.save

    Usuario.last
  end

  def create_params_usuario(usuario)
    {
        usuario: {
            nome: usuario.nome,
            login: usuario.login,
            password: usuario.password,
            password_confirmation: usuario.password_confirmation,
        }
    }
  end
end

class ActionDispatch::IntegrationTest
  include SessionHelper
end
