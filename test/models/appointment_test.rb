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
require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
