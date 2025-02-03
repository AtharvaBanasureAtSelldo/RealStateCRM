class CreateAppointments < ActiveRecord::Migration[8.0]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :user_id
      t.integer :client_id

      t.timestamps
    end
  end
end
