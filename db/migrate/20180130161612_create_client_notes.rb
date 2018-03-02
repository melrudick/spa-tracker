class CreateClientNotes < ActiveRecord::Migration
  def change
    create_table :client_notes do |t|
      t.integer :client_id
      t.integer :note_id
    end
  end
end
