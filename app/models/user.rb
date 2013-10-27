class User < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :login, :password, :rol, :name
  belongs_to :pianizm
  has_many :friends
  has_many :songs
  has_many :song_lists
  has_one :historic

  # Constraints
  # No nil ni 'corto'
  validates_presence_of :login , :message => 'El login no puede ser vacio'
  validates_length_of :login, :minimum => 1 ,:message => 'Login muy corto'
  validates_presence_of :password ,:message => 'La clave no puede ser vacia'
  validates_length_of :password, :minimum => 8  ,:message => 'La clave debe tener 8 caracteres'
  validates_presence_of :rol
  validates_presence_of :name ,:message => 'El nombre no puede ser vacio'
  validates_length_of :name, :minimum => 3 ,:message => 'El nombre debe tener 3 o mas caracteres'

  # Uniqueness
  validates_uniqueness_of :login , :message => 'Ese login ya se encuentra en uso'

  #Methods
  def autenticar(password)
    return self.password.eql?(password)
  end

   #metodo que agrega un amigo al usuario en sesion
  def self.addFriend (idFriend)
      #Friend.new(user: self.id, idfriend: idFriend).save
      self.friends.new(idfriend: idFriend).save
  end

  # Metodo que busca los usuarios por el parámetro de búsqueda asociado.
  # Si es un login, retorna el usuario al que le pertenece. Si es un nombre, busca todos los asociados.
  def self.searchFriend(search)
    u= []
    us= User.find_by_login(search)
    if(us.nil?)
      if (!search.nil?)
        u= User.find_all_by_name(search)
        uu= User.find_all_by_name(search.capitalize)
        uuu= User.find_all_by_rol(search.capitalize)
        arr= search.strip.split(" ")
        string=''
        arr.each do |w|
          string+= w+' '
        end
        uuuu= User.find_all_by_name(string.strip)
        uuuuu= User.where("name like ?", "%#{search}%")
        uuuuuu= User.where("name like ?", "%#{search.capitalize}%")
        uuuuuuu= User.where("rol like ?", "%#{search.capitalize}%")
        uuuuuuuu= User.where("login like ?", "%#{search}%")

        c=u|uu|uuu|uuuu|uuuuu|uuuuuu|uuuuuuu|uuuuuuuu
        return c
      end
      return u
    else
      u.push(us)
      return u
    end

    #if !search.nil?
      #string ="select * from users where users.name like "+ search.to_s + " or users.name like " + search.to_s.capitalize + " or users.login like "+ search.to_s + " or users.rol like " + search.to_s.capitalize
     # string='select * from users where 1=2'
      #u2= User.find_by_sql(string)
    #else
     # u2=[]
    #end
    #c= u|u2


  end

  #retorna todas las canciones subidas por un tutor
  def self.getUploadedSongs(login)
    songs=Song.find_all_by_author(login)
    return songs
  end


end
