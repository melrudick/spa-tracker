class AppointmentsController < ApplicationController

  get "/appointments/:id" do
    @appointment = Appointment.find_by[:id]
    erb :'users/index'
  end

  post '/date' do

  end

end
