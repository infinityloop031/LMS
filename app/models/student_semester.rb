class StudentSemester < ApplicationRecord
  belongs_to :student
  belongs_to :semester
  validates :year ,presence: true
end
