class Hospital < ApplicationRecord
  has_many :doctors

  def number_of_doctors
    Doctor.group(:hospital_id).count.values.first
  end

  def unique_school
    doctors.distinct.pluck(:education)
  end
end
