class CreateAppointments < ActiveRecord::Migration[7.0]
  def change
    create_table :appointments do |t|
      t.references :doctor
      t.references :patient
      t.date :date
      t.time :hour
      t.timestamps
    end
  end
end
