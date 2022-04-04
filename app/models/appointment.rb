class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'Patient'
  belongs_to :doctor, class_name: 'Doctor'

  validates_uniqueness_of :date, scope: [:doctor_id, :patient_id]
  validates_uniqueness_of :hour, scope: [:doctor_id, :patient_id]
  validates_presence_of :date, :hour, :doctor_id, :patient_id
  validates :date, date: {after: Proc.new { Date.today }, message: 'Deve ser maior que a data atual'}
end
