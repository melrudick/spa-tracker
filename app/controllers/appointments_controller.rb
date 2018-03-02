class AppointmentsController < ApplicationController

  get "/appointments" do
    @appointments = Appointment.all
    erb :'users/show'
  end

  get '/appointments/new' do
    if logged_in?
      @clients = Client.all
      erb :'appointments/new'
    else
      redirect "/"
    end
  end

  post '/appointments/new' do
    if !params.empty?
      @appointment = Appointment.create!(appointment_type: params[:appointment_type], date: params[:date], client_id: params[:client_id], user_id: current_user.id)
      session[:user_id] = current_user.id
      redirect "users/#{current_user.id}"
    end
  end

  get "/appointments/:id" do
    @appointment = Appointment.find_by(id: params[:id])
    erb :index
  end

  get "/appointments/:id/edit" do
      @appointment = Appointment.find_by(id: params[:id])
      if @appointment.user == current_user
        erb :'appointments/edit'
      else
      redirect "/login"
    end
  end

  patch "/appointments/:id" do
    @appointment = Appointment.find_by(id: params[:id])
    if @appointment.user == current_user
      @appointment.update(params[:appointment])
      redirect to "users/#{@appointment.user_id}"
    else
      redirect "/appointments/#{@appointment.id}/edit"
    end
  end

  delete "/appointments/:id/delete" do
    @appointment = Appointment.find(params[:id])
    session[:user_id] = current_user.id
    if logged_in? && current_user.appointments.include?(@appointment)
      @appointment.destroy
      redirect "users/#{current_user.id}"
    else
      redirect "/login"
    end
  end
end
