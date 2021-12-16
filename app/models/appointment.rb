# == Schema Information
#
# Table name: appointments
#
#  id                 :bigint           not null, primary key
#  appt_time          :string           not null
#  appt_date          :string           not null
#  kind               :string           not null
#  patient_first_name :string           not null
#  patient_last_name  :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  doctor_id          :integer          not null
#
class Appointment < ApplicationRecord
  validates :appt_time, :appt_date, :kind, :patient_first_name, :patient_last_name, :doctor_id, presence: true
  validates :kind, inclusion: {in: ["New Patient", "Follow-up"]}
  
  belongs_to :doctor

  def self.valid?(epoch_time, doctor_id)

    return true if fifteen_minute_interval?(epoch_time?) && within_appt_limit()
    false
  end

  def fifteen_minute_interval(epoch_time)
    return true if epoch_time % 900 == 0
    false
  end

  def within_appt_limit(epoch_time, doctor_id)
    parsed_date = parse_date(epoch_time)
    parsed_time = parse_time(epoch_time)
    appts = Appointment.find_by(doctor_id, parsed_date, parsed_time)
    return false if appts.length == 3
    true
  end

  def parse_date(epoch_time)
    appt_date_object = Time.at(epoch_time).to_datetime
    appt_date_str = appt_date_object.to_s.split("T")
    appt_date_str[0]
  end

  def parse_time(epoch_time)
    appt_time_object = Time.at(epoch_time).to_datetime
    appt_time_str = appt_date_object.to_s.split("T")
    appt_time_str[1]
  end

end
