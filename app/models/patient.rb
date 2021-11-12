class Patient < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  belongs_to :doctor
end 