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
    puts usuario.password
    post user_sessions_url, params: {
        user_session: {
            login: usuario.login,
            password: usuario.password
        }
    }
  end
end

class ActionDispatch::IntegrationTest
  include SessionHelper
end
