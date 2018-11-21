require 'test_helper'
require 'pp'

class UserSessionTest < ActiveSupport::TestCase
  setup do
    usuario = usuarios(:one)
    @attributes = {
        login: usuario.login,
        password: "123321"
    }
    @session = {}
    @user_session = UserSession.new @session, @attributes
  end

  test "should authenticate" do
    assert @user_session.authenticate!
    assert_not_nil @session[:usuario_id]
  end

  test "should not authenticate" do
    @attributes[:password] = "123456"
    @user_session = UserSession.new @session, @attributes
    assert_not @user_session.authenticate!
    assert_not @user_session.user_signed_in?
  end

  test "should store" do
    usuario = usuarios(:two)
    @user_session.store(usuario)
    assert_equal @user_session.current_user.id, usuario.id
  end

  test "should return current user" do
    usuario = usuarios(:one)
    @user_session.authenticate!
    assert_equal usuario.id, @user_session.current_user.id
  end

  test "should return user signed in?" do
    @user_session.authenticate!
    assert @user_session.user_signed_in?
  end

  test "should destroy" do
    @user_session.authenticate!
    @user_session.destroy
    assert_not @user_session.user_signed_in?
  end

  test "should verify role" do
    @user_session.authenticate!
    assert_not @user_session.user_has_role :test_role
    @user_session.current_user.add_role :test_role
    assert @user_session.user_has_role :test_role
  end
end
