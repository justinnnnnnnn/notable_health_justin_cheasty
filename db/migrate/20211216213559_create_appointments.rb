class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.string :appt_time, null: false
      t.string :appt_date, null: false
      t.string :kind, null: false
      t.string :patient_first_name, null: false
      t.string :patient_last_name, null: false
      t.timestamps
    end
  end
end
