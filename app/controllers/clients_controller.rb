class ClientsController < ApplicationController

  get "/clients" do
    @clients = Client.all
    erb :'clients/index'
  end

  get "/clients/new" do
    erb :'clients/new'
  end

  post "/clients" do
    @client = Client.create(name: params[:name], notes: params[:notes])
    redirect "clients/#{@client.id}"
  end

  get "/clients/:id" do
    @client = Client.find(params[:id])
    erb :"clients/show"
  end

  get "/clients/:id/edit" do
    @client = Client.find_by(id: params[:id])
    erb :'clients/edit'
  end

  patch "/clients/:id" do
    @client = Client.find(params[:id])
    @client.name = params[:name]
    @client.notes = params[:notes]
    @client.save
    redirect to "clients/#{@client.id}"
  end
end
