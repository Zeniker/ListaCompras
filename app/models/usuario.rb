class Usuario < ApplicationRecord
  validates_presence_of :nome, :password, :login
  validates_length_of :login, minimum: 5
  validates_length_of :password, minimum: 5

  has_secure_password

  def self.authenticate_session(login, password)
    usuario = find_by(login: login)
    if usuario.present?
      usuario.authenticate(password)
    end
  end
end
