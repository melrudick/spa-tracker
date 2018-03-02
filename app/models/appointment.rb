class Appointment < ActiveRecord::Base
  validates :date, presence: true
  belongs_to :user
  belongs_to :client
end
