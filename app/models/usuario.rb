class Usuario < ApplicationRecord
  include Discard::Model

  rolify :role_cname => 'Funcao'
  validates_presence_of :nome, :login
  validates_length_of :login, minimum: 5, maximum: 20, allow_nil: true
  validates_length_of :password, minimum: 5, maximum: 20, allow_nil: true
  validates_length_of :nome, maximum: 50
  validates_uniqueness_of :login
  after_create :assign_default_role
  self.discard_column = :discarded_at

  has_secure_password

  def self.authenticate_session(login, password)
    usuario = find_by(login: login)
    if usuario.present?
      usuario.authenticate(password)
    end
  end

  def assign_default_role
    self.add_role(:common) if self.roles.blank?
  end

  def has_admin_role?
    self.has_role? :admin
  end
end
