# encoding: utf-8
class PianizmController < ApplicationController


  def index
   # User.new(login: 'Diego', password: 'soydiego', rol: 'Tutor').save


  end

  def  create
    login = params[:username]
    password = params[:password]
    res = Pianizm.autenticarUsuario(login, password)
    if res
      id= User.find_by_login(login).id
      session[:current_user_id] = id
      redirect_to user_index_path
     # redirect_to edit_user_path(id)
    else
      flash[:title]='Error'
      flash[:notice]='Usted no existe en el sistema, por favor regístrese'
      redirect_to pianizm_index_path
    end
  end
  def new

  end
  def edit

  end

  def show

  end

  def destroy
    # Remove the user id from the session
    @_current_user = session[:current_user_id] = nil
  end

  def logout
    destroy
    flash[:title] = 'Información'
    flash[:notice] = 'Ha cerrado sesión correctamente'
    redirect_to pianizm_index_path
  end
end
