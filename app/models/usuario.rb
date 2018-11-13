class Usuario < ApplicationRecord
  validates_presence_of :nome, :password, :login
  validates_length_of :login, minimum: 5
  validates_length_of :password, minimum: 5

  has_secure_password
end
