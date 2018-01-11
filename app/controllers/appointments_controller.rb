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
    @appointment = Appointment.find_by[:id]
    erb :'users/index'
  end

end
