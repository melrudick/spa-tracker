class Note < ActiveRecord::Base
   # has_many :client_notes
   # has_many :clients, through: :client_notes
   belongs_to :client 
end
