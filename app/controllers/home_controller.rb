class HomeController < ApplicationController
  def index
    @mensagem = "Bem-vindo"        
    @aps = current_user.aps.count
    @clients = current_user.clients.count
  end

end
