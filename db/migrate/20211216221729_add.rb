class Add < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :doctor_id, :integer, null: false
  end
end
