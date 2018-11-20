require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
  test "should crypt password" do
    usuario = Usuario.new
    usuario.password = "123321"
    assert_not_equal usuario.password, usuario.password_digest
  end

  test "validates presence of nome" do
    usuario = usuarios(:one)
    usuario.nome = nil
    assert_not usuario.save
  end

  test "validates presence of login" do
    usuario = usuarios(:one)
    usuario.login = nil
    assert_not usuario.save
  end

  test "should save" do
    usuario = usuarios(:one)
    usuario.password = "123321"
    usuario.password_confirmation = "123321"
    assert usuario.save
  end

end
