require 'rails_helper'

RSpec.describe "Doctor Show Page" do
  before do
    @hospital = Hospital.create!(name: "St. Jude Children's Hospital")
    @doctor = Doctor.create!(name: "Dr. Hope",
                             specialty: "Surgery",
                             education: "Yale University",
                             hospital_id: @hospital.id)
    @patient1 = Patient.create!(name: 'Joe Schmoe',
                                age: 35,
                                doctor_id: @doctor.id)
    @patient2 = Patient.create!(name: 'Jill Schmill',
                                age: 25,
                                doctor_id: @doctor.id)
    visit doctor_path(@doctor)
  end

  describe "when i vist a doctor show page" do
    it "i see that doctor's name, specialty, and education" do
      expect(page).to have_content(@doctor.name)
      expect(page).to have_content(@doctor.specialty)
      expect(page).to have_content(@doctor.education)
    end

    it "i see the name of the hospital where this doctor works" do
      expect(page).to have_content(@hospital.name)
    end

    it "i see the names of all the patients this doctor has" do
      expect(page).to have_content(@patient1.name)
      expect(page).to have_content(@patient2.name)
    end
  end
end