class UsuariosController < ApplicationController
  TITULO_LISTAGEM='Usuários Cadastrados'
  TITULO_VISUALIZACAO='Visualização de Usuário'
  TITULO_INCLUSAO='Inclusão de Usuário'
  TITULO_ALTERACAO='Alteração de Usuário'
  TITULO_EXCLUSAO='Exclusão de Usuário'

  before_action :require_authentication
  before_action :require_admin_role, except: [:index ]

  def index
    define_titulo_pagina TITULO_LISTAGEM
    if current_user.has_admin_role?
      @usuarios = Usuario.kept
    else
      @usuarios = Usuario.find_only_current session[:usuario_id]
    end

    @usuarios.page(params[:page])
  end

  def new
    define_titulo_pagina TITULO_INCLUSAO
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new usuario_params
    if @usuario.save
      redirect_to usuarios_path,
                  notice: 'Usuário criado com sucesso!'
    else
      define_titulo_pagina TITULO_INCLUSAO
      render action: :new
    end
  end

  def edit
    @usuario = Usuario.find params[:id]
  end

  def update
    @usuario = Usuario.find params[:id]
    if @usuario.update usuario_params
      redirect_to usuarios_path,
                  notice: 'Usuário atualizado com sucesso'
    else
      define_titulo_pagina TITULO_ALTERACAO
      render action: :edit
    end
  end

  def confirm_delete
    define_titulo_pagina TITULO_EXCLUSAO
    @usuario = Usuario.find params[:id]
    if same_user_as_current @usuario
      redirect_to usuarios_path
    end
  end

  def destroy
    @usuario = Usuario.find params[:id]
    if same_user_as_current @usuario
      redirect_to usuarios_path
    end

    @usuario.discard

    redirect_to usuarios_path,
                notice: 'Usuário excluído com sucesso'
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :login, :password, :password_confirmation)
  end

  def require_admin_role
    unless current_user.has_admin_role?
      redirect_to usuarios_path
    end
  end

  def same_user_as_current(usuario)
    current_user.id == usuario.id
  end
end