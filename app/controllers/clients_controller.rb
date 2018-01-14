class ClientsController < ApplicationController

  get "/clients" do
    @clients = Client.all
    redirect 'users/show'
  end

  get "/clients/new" do
    @client = Client.create(name: params[:name], notes: params[:notes])
    erb :'clients/new'
  end

  get "/clients/:id/edit" do
    @client = Client.find_by(id: params[:id])
    erb :'clients/edit'
  end
end
