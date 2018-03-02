class User < ActiveRecord::Base
  has_secure_password
  has_many :appointments
  has_many :clients, through: :appointments
end

# two things not working:
  # - I want edit client to allow edit of name, but to ADD A NEW note.
  # - How do you put together the #build?

  # - I should be able to add a client or an appointment, delete an appointment, and add a note to a client. Right now there are appointments with non-existant clients (I have deleted in console) that will throw an error once hit.
