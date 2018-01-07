class ClientsController < ApplicationController

  get "/clients" do
    @clients = Client.all
    redirect 'users/show'
  end
end
