require 'test_helper'
require 'pp'

class UserSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @usuario = usuarios(:one)
    @usuario.password = "123321"
  end

  test "should get new" do
    get new_user_sessions_url
    assert_response :success
  end

  test "should create user_session" do
    # post user_sessions_url, params: {
    #     user_session: {
    #         login: @usuario.login,
    #         password: @usuario.password
    #     }
    # }

    sign_in_as @usuario
    assert_redirected_to root_url
  end

  test "should get destroy" do
    delete user_sessions_url
    assert_redirected_to new_user_sessions_url
  end
end
