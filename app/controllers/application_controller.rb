class ApplicationController < ActionController::Base
  delegate :current_user, :user_signed_in?, :user_has_role, to: :user_session

  helper_method :current_user, :user_signed_in?, :user_has_role

  def define_titulo_pagina (titulo_pagina)
    @titulo_pagina = titulo_pagina
  end

  def user_session
    UserSession.new(session)
  end

  def require_authentication
    unless user_signed_in?
      redirect_to new_user_sessions_path
    end
  end

  def require_no_authentication
    if user_signed_in?
      redirect_to root_path
    end
  end

  def redirect_with_dependencies(redirect_path)
    redirect_to redirect_path,
                alert: 'Este item possui dependências. Não é possível excluí-lo.'
  end

end
