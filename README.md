# Client Tracker

## Usage

1.

To use this app, just clone, run `rake db:migrate` and then run `shotgun`.
Everything should be set up.


# spa-tracker

<p> Your Clients: </p>
 <% if @clients.length == 0 %>
  <p> You have no clients. Add a client using the link below.</p>
 <% end %>
# <% @clients.each do |client| %>
#   <ul>
#     <li><a href="/clients/<%=client.id%>"><%= client.name %></a></li>
#   </ul>
# <% end %>
#
# <p>Your Appointments: </p>
# <% @user.appointments.each do |appointment| %>
#   <ul>
#     <li><a href="/appointments/<%=appointment.id%>"><%= appointment.name %></a></li>
#   </ul>
# <% end %>
