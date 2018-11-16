class UserSession
  include ActiveModel::Model

  attr_accessor :login, :password
  validates_presence_of :login, :password

  def initialize(session, attributes={})
    @session = session
    @login = attributes[:login]
    @password = attributes[:password]
  end

  def authenticate!
    user = Usuario.authenticate_session(@login, @password)

    if user.present?
      store(user)
    else
      errors.add(:base, :invalid_login)
      false
    end
  end

  def store(usuario)
    @session[:usuario_id] = usuario.id
  end

  def current_user
    Usuario.find(@session[:usuario_id])
  end

  def user_signed_in?
    @session[:usuario_id].present?
  end

  def destroy
    @session[:usuario_id] = nil
  end

end