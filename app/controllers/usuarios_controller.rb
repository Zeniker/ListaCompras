class UsuariosController < ApplicationController
  Titulo_listagem='Usuários Cadastrados'
  Titulo_visualizacao='Visualização de Usuário'
  Titulo_inclusao='Inclusão de Usuário'
  Titulo_alteracao='Alteração de Usuário'
  Titulo_exclusao='Exclusão de Usuário'

  def index
    define_titulo_pagina Titulo_listagem
    @usuarios = Usuario.all
  end

  def new
    define_titulo_pagina Titulo_inclusao
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new usuario_params
    if @usuario.save
      redirect_to usuarios_path,
                  notice: 'Usuário criado com sucesso!'
    else
      define_titulo_pagina Titulo_inclusao
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
      define_titulo_pagina Titulo_alteracao
      render action: :edit
    end
  end

  def confirm_delete
    define_titulo_pagina Titulo_exclusao
    @usuario = Usuario.find params[:id]
  end

  def destroy
    @usuario = Usuario.find params[:id]
    @usuario.destroy

    redirect_to usuarios_path,
                notice: 'Usuário excluído com sucesso'
  end

  private

  def usuario_params
    params.require(:usuario).permit(:nome, :login, :password, :password_confirmation)
  end
end