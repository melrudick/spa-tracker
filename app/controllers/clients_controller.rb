class ClientsController < ApplicationController

  get "/clients" do
    @clients = Client.all
    erb :'clients/index'
  end

  get "/clients/new" do
    erb :'clients/new'
  end

  post "/clients" do
    @client = Client.create(name: params[:name])
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

  post "/clients/:id" do
    @client = Client.find(params[:id])
    @client.notes.build(content: params[:content])
    @client.save
    redirect to "clients/#{@client.id}"
  end
end

# && current_user.clients.include?(@client)
