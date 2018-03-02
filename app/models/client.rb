class Client < ActiveRecord::Base
  has_many :appointments
  has_many :users, through: :appointments
  has_many :notes
  # has_many :notes, through: :client_notes
end
