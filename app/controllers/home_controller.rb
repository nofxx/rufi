class HomeController < ApplicationController
  def index
    @mensagem = "Bem-vindo".upcase
  end

end
