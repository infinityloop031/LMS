class Semester < ApplicationRecord
    has_many :student_semesters
    has_many :students, through: :student_semesters
    has_many :enrollments
    has_many :sections
end
