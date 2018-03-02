class RemoveClientNotesTable < ActiveRecord::Migration
  def change
    drop_table :client_notes
  end
end
