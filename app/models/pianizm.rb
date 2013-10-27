class Pianizm < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :users
  has_many :songs

  def self.autenticarUsuario(login, password)
    user = User.find_by_login(login)
    return false if user.nil?
    return user.autenticar(password)
  end


end
