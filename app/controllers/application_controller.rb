class ApplicationController < ActionController::Base
  delegate :current_user, :user_signed_in?, to: :user_session

  helper_method :current_user, :user_signed_in?

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

end
