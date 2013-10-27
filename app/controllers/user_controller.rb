# encoding: utf-8
class UserController < ApplicationController

  def index
    id = session[:current_user_id]
    @login= User.find(id).login
    @userName= User.find(id).name

  end


  def create
    login = params[:username].downcase
    password = params[:password]
    rol = params[:rol]
    @nombreSplit= params[:name].split(" ")
    nombre= ""
    if @nombreSplit.length >0
      @nombreSplit.each do |n|
      nombre= nombre+ n.capitalize+" "
      end
    else
       nombre=@nombreSplit.capitalize.strip
    end


    User.new(login: login, password: password, rol: rol, name: nombre.strip).save

    if(login.empty? or password.empty? or nombre.empty?)
      flash[:title]='¡Error!'
      flash[:notice]='Los datos son incorrectos, por favor verifiquelos'
    else
      flash[:title]='¡Exito!'
      flash[:notice]='Su cuenta ha sido creada exitosamente. Por favor haga login'
    end


    redirect_to pianizm_index_path

  end

  def upload

  end

  def search
    @search= params[:search]
    @result= User.searchFriend(@search)
    return @result
  end

  def add

  end

  def show
    @userId=params[:id]
    @usr= User.find(@userId)
    @usrUploadedSongs= User.getUploadedSongs(@usr.login)
    @booleanFriends= false
    @currentUser= User.find(session[:current_user_id])

    @usrId= params[:usrId]
    @boolean= params[:booleanAdd]
    if( !@usrId.nil? or !@boolean.nil? )
      puts 'testeo'
      puts @usrId
      u= User.find(session[:current_user_id])
      u.friends.new(idfriend: @usrId).save
      puts 'tam friends'
      puts u.friends.size
        puts 'WIN'
      flash[:title]='¡Información!'
      flash[:notice]='Amigo agregado exitosamente'
    else
      #flash[:title]='¡ERROR!'
      #flash[:notice]='Tu amigo no fue agregado'
    end



  end

  def friends
  @friends= Friend.find_all_by_user_id(session[:current_user_id])
    puts 'hey'
    puts @friends.size
    puts @friends
  end

end
