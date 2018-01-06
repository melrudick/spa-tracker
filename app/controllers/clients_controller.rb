class ClientsController < ApplicationController

  get "/clients" do
    @clients = Client.all
    erb :index
  end
end
