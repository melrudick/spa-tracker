class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :appointment_type
      t.datetime :date
      t.integer :user_id
      t.integer :client_id
    end
  end
end
