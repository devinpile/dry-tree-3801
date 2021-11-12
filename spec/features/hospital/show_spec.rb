require 'rails_helper'

RSpec.describe "Hospital Show Page" do
  before do
    @hospital = Hospital.create!(name: "St. Jude Children's Hospital")
    @doctor1 = Doctor.create!(name: "Dr. Karen Hope",
                             specialty: "Cardiothoracic Surgery",
                             education: "Yale University",
                             hospital_id: @hospital.id)
    @doctor2 = Doctor.create!(name: "Dr. Hugo Smith",
                             specialty: "Surgical Endocrinology",
                             education: "Yale University",
                             hospital_id: @hospital.id)
    @doctor3 = Doctor.create!(name: "Dr. Doolittle Strange",
                             specialty: "Transplant Surgery",
                             education: "Harvard University",
                             hospital_id: @hospital.id)
    visit hospital_path(@hospital)
  end

  describe "when i visit a hospital show page" do
    it "i see the hospital's name" do
      expect(page).to have_content(@hospital.name)
    end

    it "i see the number of doctors that work at the hospital" do
      expect(page).to have_content("Number of doctors: #{@hospital.number_of_doctors}")
      expect(@hospital.number_of_doctors).to eq(3)
    end

    it "i see a unique list of universities that this hospital's doctors attended" do
      within "#education" do
        expect(page).to have_content("Yale University")
        expect(page).to have_content("Harvard University")
      end
    end
  end
end