require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase

  setup do
    @usuario = Usuario.new
    @usuario.nome = "Matheus"
    @usuario.login = "darkpizza"
    @usuario.password = "123321"
    @usuario.password_confirmation = "123321"
  end

  test "should crypt password" do
    assert_not_equal @usuario.password, @usuario.password_digest
  end

  test "validates presence of fields" do
    @usuario.nome = nil
    @usuario.login = nil
    @usuario.password = nil
    @usuario.password_confirmation = nil
    assert_not @usuario.valid?
    assert_equal [:nome, :login, :password], @usuario.errors.keys
  end

  test "validates length of nome" do
    @usuario.nome = "a" * 51
    assert_not @usuario.valid?
    assert_equal [:nome], @usuario.errors.keys
    @usuario.nome = "a" * 50
    assert @usuario.valid?
  end

  test "validates minimum length of login" do
    @usuario.login = "a" * 4
    assert_not @usuario.valid?
    assert_equal [:login], @usuario.errors.keys
    @usuario.login = "a" * 5
    assert @usuario.valid?
  end

  test "validates maximum length of login" do
    @usuario.login = "a" * 21
    assert_not @usuario.valid?
    assert_equal [:login], @usuario.errors.keys
    @usuario.login = "a" * 20
    assert @usuario.valid?
  end

  test "validates minimum length of password" do
    @usuario.password = "a" * 4
    @usuario.password_confirmation = @usuario.password
    assert_not @usuario.valid?
    assert_equal [:password], @usuario.errors.keys
    @usuario.password = "a" * 5
    @usuario.password_confirmation = @usuario.password
    assert @usuario.valid?
  end

  test "validates maximum length of password" do
    @usuario.password = "a" * 21
    @usuario.password_confirmation = @usuario.password
    assert_not @usuario.valid?
    assert_equal [:password], @usuario.errors.keys
    @usuario.password = "a" * 20
    @usuario.password_confirmation = @usuario.password
    assert @usuario.valid?
  end

  test "validates confirmation of password" do
    @usuario.password = "123789"
    @usuario.password_confirmation = "123333"
    assert_not @usuario.valid?
    assert_equal [:password_confirmation], @usuario.errors.keys
    @usuario.password = "123123"
    @usuario.password_confirmation = "123123"
    assert @usuario.valid?
  end

  test "validates uniqueness of login" do
    @usuario.login = "guilopes"
    assert_not @usuario.valid?
  end

  test "should save" do
    assert @usuario.save
  end

  test "has assigned default role" do
    @usuario.save

    assert @usuario.has_role?(:common)
  end

  test "has assigned admin role" do
    @usuario.save
    @usuario.add_role :admin

    assert @usuario.has_admin_role?
  end

  test "should discard" do
    @usuario.save
    @usuario.discard

    assert Usuario.last.discarded?
  end

end
