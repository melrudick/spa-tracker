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
    binding.pry
    if params[:appointment_type].empty?
      @appointment = Appointment.create!(appointment_type: params[:appointment_type], date: params[:date])
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    end
  end

  get "/appointments/:id" do
    @appointment = Appointment.find_by[:id]
    erb :'users/index'
  end

end
